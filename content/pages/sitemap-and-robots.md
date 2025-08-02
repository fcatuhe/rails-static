---
title: Generate sitemaps and robots.txt
position: 13
---

# <%= @page.title %>

Generate XML sitemaps and robots.txt files, hooked into Parklife's build process. After all HTML pages are built, the sitemap generator discovers them, assigns priorities, and provides accurate last modification dates using Git timestamps.

### Add Parklife after build hook

##### _[Parkfile](https://github.com/fcatuhe/rails-static/blob/b1a8166d29c9cb56bd1875370476a32f5f364148/Parkfile#L12){:target="github"}_

```ruby
...

Parklife.application.after_build do |application|
  sitemap = Sitemap.new(base_url: application.config.base, build_dir: application.config.build_dir, generate_robots: true)

  return Rails.logger.error("Error generating sitemap: #{sitemap.errors.full_messages.join(', ')}") unless sitemap.valid?

  sitemap.generate!
end

...
```

### Create the sitemap models

- **Sitemap** model: _[app/models/sitemap.rb](https://github.com/fcatuhe/rails-static/blob/b1a8166d29c9cb56bd1875370476a32f5f364148/app/models/sitemap.rb){:target="github"}_
- **Sitemap::Entry** model: _[app/models/sitemap/entry.rb](https://github.com/fcatuhe/rails-static/blob/b1a8166d29c9cb56bd1875370476a32f5f364148/app/models/sitemap/entry.rb){:target="github"}_
- **Sitemap::RobotsGeneratable** concern: _[app/models/sitemap/robots_generatable.rb](https://github.com/fcatuhe/rails-static/blob/b1a8166d29c9cb56bd1875370476a32f5f364148/app/models/sitemap/robots_generatable.rb){:target="github"}_

### Remove default robots.txt

Delete the default `robots.txt` file from the `public/` folder.

### [temporary] Install Parklife edge version

At the time of this guide, the build hooks are not included in the latest Parklife release.

##### _[Gemfile](https://github.com/fcatuhe/rails-static/blob/45941923dc38f303e7bb124734fe0a2f914db347/Gemfile#L28){:target="github"}_

```ruby
...
# TODO: 30jul25 - switch back to gem release once PR #124 is included (re-introduces build callbacks)
#       https://github.com/benpickles/parklife/pull/124
gem "parklife", github: "benpickles/parklife"
...
```

```sh
bundle
```

---

## Implementation Details

### Generated Files

The system generates three files in your build directory:

- **sitemap.xml** - Standard XML sitemap with proper formatting
- **sitemap.xml.gz** - Minified and compressed version for better performance
- **robots.txt** - Search engine directives with sitemap references

### Sitemap Features

#### Automatic Discovery

The sitemap automatically discovers all HTML files in the build directory, excluding error pages (404.html, 500.html, etc.).

#### Priorities

Pages are assigned priorities based on their URL structure:
- Homepage (`/`) - Priority 1.0
- Top-level pages (`/page`) - Priority 0.8
- Nested pages (`/section/page`) - Priority 0.5

#### Last Modification Dates

To provide accurate last modification dates, the system attempts to find the original source file for each HTML page. Source files are discovered using `CONTENT_PATTERNS`:
- `content/*/%s.md` - Markdown files in content directories
- `app/views/*/%s.html.erb` - ERB view templates

The timestamp strategy depends on whether a source file is found:
1. **Git history** - Last commit date for the source file
2. **File system** - File modification time if the file isn't tracked in Git
3. **Current time** - Used when the source file was not found

#### Change Frequency

All pages are marked with a "monthly" change frequency by default.

### Model Architecture

The implementation follows Rails conventions with a main `Sitemap` model and supporting classes:

- `Sitemap` - Main model handling generation and file writing
- `Sitemap::Entry` - Represents individual sitemap entries
- `Sitemap::RobotsGeneratable` - Mixin for robots.txt generation

### Robots.txt Content

The generated robots.txt file includes:

```
User-agent: *
Allow: /

Sitemap: https://example.com/sitemap.xml.gz
Sitemap: https://example.com/sitemap.xml
```

Both compressed and uncompressed sitemap URLs are included for maximum compatibility.

### Configuration

The sitemap generator requires:
- `base_url` - The site's base URL
- `build_dir` - Directory containing built HTML files
- `generate_robots` - Boolean flag to enable robots.txt generation

Error pages defined in `ERROR_PAGES` constant are automatically excluded from the sitemap.

---

_Commit: [Sitemap and Robots](https://github.com/fcatuhe/rails-static/commit/b1a8166d29c9cb56bd1875370476a32f5f364148){:target="github"}_

---

→ <%= link_to_page "next", data: { controller: "hotkey", action: "keydown.right@document->hotkey#click" } %>

_← <%= link_to_page "web-page-metadata", data: { controller: "hotkey", action: "keydown.left@document->hotkey#click" } %>_
