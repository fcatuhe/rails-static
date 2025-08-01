require "builder"

class Sitemap
  include ActiveModel::Model
  include ActiveModel::Attributes

  include Sitemap::RobotsGeneratable

  ERROR_PAGES = %w[400.html 404.html 406-unsupported-browser.html 422.html 500.html].freeze

  attribute :base_url, :string
  attribute :build_dir, :string
  attribute :generate_robots, :boolean, default: false

  validates :base_url, presence: true, format: { with: URI.regexp(%w[http https]) }
  validates :build_dir, presence: true

  def generate!
    write_sitemap!
    write_compressed_sitemap!

    handle_robots_generation!

    total_pages
  end

  private

  def write_sitemap!
    File.write(sitemap_path, xml_sitemap)

    Rails.logger.info("Generated sitemap.xml with #{total_pages} URLs")
  end

  def write_compressed_sitemap!
    Zlib::GzipWriter.open(sitemap_path(compressed: true)) do |gzip|
      gzip.write(minified_xml_sitemap)
    end

    Rails.logger.info("Generated sitemap.xml.gz (compressed)")
  end

  # XML generation
  def xml_sitemap
    @xml_sitemap ||= build_xml_sitemap
  end

  def minified_xml_sitemap
    @minified_xml_sitemap ||= begin
      doc = Nokogiri::XML(xml_sitemap) { |config| config.noblanks }
      doc.to_xml(save_with: Nokogiri::XML::Node::SaveOptions::AS_XML)
    end
  end

  def build_xml_sitemap
    xml = Builder::XmlMarkup.new(indent: 2)
    xml.instruct! :xml, version: "1.0", encoding: "UTF-8"
    xml.urlset(xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9") do
      sitemap_entries.each do |entry|
        xml.url do
          xml.loc entry.canonical_url
          xml.lastmod entry.last_modified
          xml.changefreq entry.change_frequency
          xml.priority entry.priority
        end
      end
    end
  end

  # Entry collection
  def sitemap_entries
    @sitemap_entries ||= build_sitemap_entries
  end

  def build_sitemap_entries
    discoverable_html_files
      .map { |file_path| Entry.new(relative_path: relative_path_from(file_path), base_url:) }
      .sort_by(&:canonical_url)
  end

  def discoverable_html_files
    return [] unless Dir.exist?(build_dir)

    Dir.glob(Pathname.new(build_dir).join("**/*.html"))
       .reject { |path| error_page?(path) }
  end

  def error_page?(file_path)
    ERROR_PAGES.include?(relative_path_from(file_path))
  end

  def relative_path_from(file_path)
    file_path.sub("#{build_dir}/", "")
  end

  def total_pages
    sitemap_entries.size
  end

  # File paths
  def sitemap_filename(compressed: false)
    filename = "sitemap.xml"
    compressed ? "#{filename}.gz" : filename
  end

  def sitemap_path(compressed: false)
    Pathname.new(build_dir).join(sitemap_filename(compressed:))
  end

  def sitemap_url(compressed: false)
    "#{base_url}/#{sitemap_filename(compressed:)}"
  end
end
