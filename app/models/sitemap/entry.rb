class Sitemap::Entry
  include ActiveModel::Model
  include ActiveModel::Attributes

  CONTENT_PATTERNS = %w[content/*/%s.md app/views/*/%s.html.erb].freeze

  attribute :relative_path, :string
  attribute :base_url, :string

  def canonical_url
    "#{base_url}#{url}"
  end

  def last_modified
    return current_timestamp unless source_file

    git_timestamp || file_timestamp
  end

  def change_frequency
    "monthly"
  end

  def priority
    case url
    when "/" then "1.0"
    when /^\/[^\/]+$/ then "0.8"
    else "0.5"
    end
  end

  private

  def url
    @url ||= homepage_file? ? "/" : "/#{slug}"
  end

  def homepage_file?
    relative_path == "index.html"
  end

  def slug
    relative_path.sub(/\.html$/, "")
  end

  def source_file
    @source_file ||= find_source_file
  end

  def git_timestamp
    stdout, status = Open3.capture2("git", "log", "--format=%ad", "--date=iso-strict", "-1", source_file)
    status.success? ? stdout.strip.presence : nil
  end

  def file_timestamp
    File.mtime(source_file).iso8601
  end

  def current_timestamp
    Time.current.iso8601
  end

  def find_source_file
    files = CONTENT_PATTERNS.flat_map { |pattern| Dir.glob(pattern % slug) }

    case files.size
    when 0 then nil
    when 1 then files.first
    else
      raise StandardError, "Multiple source files found for '#{slug}': #{files.join(', ')}"
    end
  end
end
