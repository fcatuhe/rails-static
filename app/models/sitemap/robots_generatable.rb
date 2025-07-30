module Sitemap::RobotsGeneratable
  extend ActiveSupport::Concern

  def handle_robots_generation!
    return unless generate_robots

    write_robots_file!
  end

  private

  def write_robots_file!
    File.write(robots_file_path, robots_content)

    Rails.logger.info("Created robots.txt with sitemap location")
  end

  def robots_file_path
    Pathname.new(build_dir).join("robots.txt")
  end

  def robots_content
    [ robots_directives, sitemap_references ].join("\n\n")
  end

  def robots_directives
    "User-agent: *\nAllow: /"
  end

  def sitemap_references
    "Sitemap: #{sitemap_url(compressed: true)}\nSitemap: #{sitemap_url}\n"
  end
end
