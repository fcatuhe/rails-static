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
    "User-agent: *\nAllow: /\n\n#{sitemap_references}"
  end

  def sitemap_references
    "Sitemap: #{sitemap_url(compressed: true)}\nSitemap: #{sitemap_url}\n"
  end
end
