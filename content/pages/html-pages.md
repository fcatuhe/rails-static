---
title: Write pages with HTML and ERB
position: 14
---

# <%= @page.title %>

> Decant is a dependency-free frontmatter-aware framework-agnostic wrapper around a directory of static content (probably Markdown).
>
> [Ben Pickles](https://www.benpickles.com/articles/95-introducing-decant){:target="decant"}

_Probably_ Markdown - but not necessarily. Decant is content-agnostic: point it at `html.erb` files instead of `md` and write design-heavy pages in plain HTML with ERB, keeping frontmatter and skipping kramdown entirely.

### Define an HTML page model

Add a second Decant collection alongside markdown pages, with a model per content directory:

##### _[app/models/html_page.rb](https://github.com/fcatuhe/rails-static/blob/034615a32e7211f13c5e1648b72dfad25eafb570/app/models/html_page.rb){:target="github"}_

```ruby
HtmlPage = Decant.define(dir: "content/html_pages", ext: "html.erb") do
  frontmatter :title
end
```

### Add an ERB render helper

Without markdown, the render helper reduces to ERB processing alone - and `render_content_from` can reuse it:

##### _[app/helpers/application_helper.rb](https://github.com/fcatuhe/rails-static/blob/034615a32e7211f13c5e1648b72dfad25eafb570/app/helpers/application_helper.rb#L2){:target="github"}_

```ruby
module ApplicationHelper
  def render_content_from(page)
    Kramdown::Document.new(render_erb(page.content), input: "GFM", syntax_highlighter: :rouge).to_html.html_safe
  end

  def render_erb(content)
    render inline: content, layout: false
  end

  ...
end
```

### Route and render

##### _[config/routes.rb](https://github.com/fcatuhe/rails-static/blob/034615a32e7211f13c5e1648b72dfad25eafb570/config/routes.rb#L16){:target="github"}_

```ruby
...

  root "pages#show", slug: "index"
  get "/html/*slug", to: "html_pages#show", as: :html_page
  get "/*slug", to: "pages#show", as: :page

...
```

##### _[app/controllers/html_pages_controller.rb](https://github.com/fcatuhe/rails-static/blob/034615a32e7211f13c5e1648b72dfad25eafb570/app/controllers/html_pages_controller.rb){:target="github"}_

```ruby
class HtmlPagesController < ApplicationController
  def show
    @page = HtmlPage.find(params[:slug])
  end
end
```

##### _[app/views/html_pages/show.html.erb](https://github.com/fcatuhe/rails-static/blob/034615a32e7211f13c5e1648b72dfad25eafb570/app/views/html_pages/show.html.erb){:target="github"}_

```erb
<%%= render_erb(@page.content) %>
```

### Write pages in plain HTML

Content files become HTML with ERB and frontmatter, and still benefit from the whole Rails stack - layout, helpers, routes and Turbo navigation:

##### _[content/html_pages/demo.html.erb](https://github.com/fcatuhe/rails-static/blob/034615a32e7211f13c5e1648b72dfad25eafb570/content/html_pages/demo.html.erb){:target="github"}_

```erb
---
title: HTML demo
description: A page written in plain HTML with ERB, no markdown involved.
---

<h1><%%= @page.title %></h1>

...
```

See it live: <%= link_to "HTML demo", html_page_path("demo") %>

Both approaches coexist: keep kramdown-backed markdown collections for prose, and HTML collections for pages where you want full control over markup.

---

_Commit: [HTML pages](https://github.com/fcatuhe/rails-static/commit/034615a32e7211f13c5e1648b72dfad25eafb570){:target="github"}_

---

→ <%= link_to_page "next", data: { controller: "hotkey", action: "keydown.right@document->hotkey#click touch:swipe-right@window->hotkey#click" } %>

_← <%= link_to_page "sitemap-and-robots", data: { controller: "hotkey", action: "keydown.left@document->hotkey#click touch:swipe-left@window->hotkey#click" } %>_
