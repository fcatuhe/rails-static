class Sitemap
  module RobotsUpdatable
    extend ActiveSupport::Concern

    def handle_robots_update!
      return unless update_robots

      update_robots_file!

      puts_robots_action
    end

    private

    def update_robots_file!
      File.write(robots_file_path, robots_content)
    end

    def puts_robots_action
      action = robots_file_exists? ? "Updated" : "Created"
      puts "#{action} robots.txt with sitemap location"
    end

    # Content generation
    def robots_content
      robots_file_exists? ? updated_robots_content : default_robots_content
    end

    def updated_robots_content
      cleaned_content = remove_existing_sitemaps
      separator = "\n\n"
      [ cleaned_content.strip, sitemap_entries_text ].reject(&:empty?).join(separator)
    end

    def default_robots_content
      "User-agent: *\nAllow: /\n\n#{sitemap_entries_text}"
    end

    def sitemap_entries_text
      "Sitemap: #{sitemap_url(compressed: true)}\nSitemap: #{sitemap_url}\n"
    end

    # Content processing
    def remove_existing_sitemaps
      initial_robots_content.lines.reject { |line| line.strip.start_with?("Sitemap:") }.join
    end

    def initial_robots_content
      @initial_robots_content ||= File.read(robots_file_path)
    end

    # Files
    def robots_file_exists?
      return @robots_file_exists if defined?(@robots_file_exists)
      @robots_file_exists = File.exist?(robots_file_path)
    end

    # File paths
    def robots_file_path
      File.join(build_dir, "robots.txt")
    end
  end
end
