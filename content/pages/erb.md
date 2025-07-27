---
title: Get help from ERB
position: 4
---

# <%= @page.title %>

Let's update our render helper to process ERB, before sending it to Kramdown.

##### _app/helpers/application_helper.rb_

```ruby
module ApplicationHelper
  def render_content_from(page)
    erb_processed_content = render(inline: page.content, layout: false)
    Kramdown::Document.new(erb_processed_content, input: "GFM").to_html.html_safe
  end
end
```

We can use Ruby directly in our markdown files. Like this:

##### _app/views/erb.md_

```ruby
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

### Additional helpers

We can create more helpers to be used directly from our page content files:

##### _app/helpers/pages_helper.rb_

```ruby
module PagesHelper
  def link_to_page(slug)
    link_to Page.find(slug).title, page_path(slug)
  end

  def pages_image_tag(path)
    image_tag "pages/#{@page.slug}/#{path}"
  end
end
```

The `pages_image_tag` helper requires that we add the content folder to [Propshaft](https://github.com/rails/propshaft){:target="propshaft"}'s assets paths:

##### _config/application.rb_

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

_← <%= link_to_page "parklife" %>_
