---
title: Process content with ERB
position: 4
---

# <%= @page.title %>

### Update render helper for ERB processing

Update the render helper to process ERB before sending content to Kramdown:

##### _[app/helpers/application_helper.rb](https://github.com/fcatuhe/rails-static/blob/cd15800c030a0f54d095732173defb9e2c8616e7/app/helpers/application_helper.rb){:target="github"}_

```ruby
module ApplicationHelper
  def render_content_from(page)
    erb_processed_content = render(inline: page.content, layout: false)
    Kramdown::Document.new(erb_processed_content, input: "GFM").to_html.html_safe
  end
end
```

Use Ruby directly in markdown files:

##### _[app/views/erb.md](https://github.com/fcatuhe/rails-static/blob/3734267a1e63d7ef4c5d4d2eab247e641bed253e/content/pages/erb.md?plain=1#L35){:target="github"}_

```erb
...

<%%- Page.all.select(&:position).sort_by(&:position).each do |page| %>
  - <%%= link_to page.title, page.slug %>
<%%- end %>

...
```

To display:

<%- Page.all.select(&:position).sort_by(&:position).each do |page| %>
  - <%= link_to page.title, page.slug %>
<%- end %>

### Create additional helpers

Create more helpers for use in page content files:

##### _[app/helpers/pages_helper.rb](https://github.com/fcatuhe/rails-static/blob/cd15800c030a0f54d095732173defb9e2c8616e7/app/helpers/pages_helper.rb){:target="github"}_

```ruby
module PagesHelper
  def link_to_page(slug, html_options = nil)
    link_to Page.find(slug).title, page_path(slug), html_options
  end

  def pages_image_tag(path)
    image_tag "pages/#{@page.slug}/#{path}"
  end
end
```

The `pages_image_tag` helper requires that we add the content folder to [Propshaft](https://github.com/rails/propshaft){:target="propshaft"}'s assets paths:

##### _[config/application.rb](https://github.com/fcatuhe/rails-static/blob/cd15800c030a0f54d095732173defb9e2c8616e7/config/application.rb#L42){:target="github"}_

```ruby
...

module RailsStatic
  class Application < Rails::Application
    ...

    config.assets.paths << Rails.root.join("content")
  end
end
```

---

_Commit: [ERB](https://github.com/fcatuhe/rails-static/commit/cd15800c030a0f54d095732173defb9e2c8616e7){:target="github"}_

---

→ <%= link_to_page "turbo", data: { controller: "hotkey", action: "keydown.right@document->hotkey#click" } %>

_← <%= link_to_page "parklife", data: { controller: "hotkey", action: "keydown.left@document->hotkey#click" } %>_
