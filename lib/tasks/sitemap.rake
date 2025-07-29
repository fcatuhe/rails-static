
namespace :sitemap do
  desc "Generate sitemap.xml and sitemap.xml.gz files"
  task :generate, [ :base_url ] => :environment do |task, args|
    sitemap = Sitemap.new(base_url: args[:base_url])

    if sitemap.valid?
      sitemap.generate!
    else
      puts "Error generating sitemap: #{sitemap.errors.full_messages.join(', ')}"
    end
  end
end
