---
title: Set up with Decant and Kramdown
position: 2
---

# <%= @page.title %>

> Decant is a dependency-free frontmatter-aware framework-agnostic wrapper around a directory of static content (probably Markdown).
>
> [Ben Pickles](https://www.benpickles.com/articles/95-introducing-decant){:target="decant"}

Use Decant and Kramdown to parse static markdown content files through Rails' router, controller, model and view.

### Install Decant and Kramdown

##### _[Gemfile](https://github.com/fcatuhe/rails-static/blob/343b28a2dbacc5e573861089618b311a98788ed9/Gemfile#L25){:target="github"}_

```ruby
...

gem "decant"
gem "kramdown"
gem "kramdown-parser-gfm"

...
```

```sh
bundle
```

### Create a Page model that configures Decant

##### _[app/models/page.rb](https://github.com/fcatuhe/rails-static/blob/343b28a2dbacc5e573861089618b311a98788ed9/app/models/page.rb){:target="github"}_

```ruby
Page = Decant.define(dir: "content/pages", ext: "md") do
  # Declare frontmatter convenience readers.
  frontmatter :title

  # Add custom methods - it's a standard Ruby class.
  def shouty
    "#{title.upcase}!!!"
  end
end
```

### Create a helper that configures Kramdown

##### _[app/helpers/application_helper.rb](https://github.com/fcatuhe/rails-static/blob/343b28a2dbacc5e573861089618b311a98788ed9/app/helpers/application_helper.rb){:target="github"}_

```ruby
module ApplicationHelper
  def render_content_from(page)
    Kramdown::Document.new(page.content, input: "GFM").to_html.html_safe
  end
end
```

### Create the controller, view and routes

##### _[app/controllers/pages_controller.rb](https://github.com/fcatuhe/rails-static/blob/343b28a2dbacc5e573861089618b311a98788ed9/app/controllers/pages_controller.rb){:target="github"}_

```ruby
class PagesController < ApplicationController
  def show
    @page = Page.find(params[:slug])
  end
end
```

##### _[app/views/pages/show.html.erb](https://github.com/fcatuhe/rails-static/blob/343b28a2dbacc5e573861089618b311a98788ed9/app/views/pages/show.html.erb){:target="github"}_

```erb
<%%= render_content_from @page %>
```

##### _[config/routes.rb](https://github.com/fcatuhe/rails-static/blob/343b28a2dbacc5e573861089618b311a98788ed9/config/routes.rb#L15){:target="github"}_

```ruby
Rails.application.routes.draw do
  ...
  root "pages#show", slug: "index"
  get "/*slug", to: "pages#show", as: :page
end
```

### Create a first static page

##### _[content/pages/index.md](https://github.com/fcatuhe/rails-static/blob/343b28a2dbacc5e573861089618b311a98788ed9/content/pages/index.md?plain=1){:target="github"}_

```markdown
# Rails Static
```

### Start the development server

```sh
dev
```

Visit [localhost:3000](http://localhost:3000){:target="dev"} to see the first static page.

### Add pages

To add a new web page, just create the corresponding markdown file in `content/pages/` folder. Pages can be nested in sub folders.

---

_Commit: [Decant and Kramdown](https://github.com/fcatuhe/rails-static/commit/343b28a2dbacc5e573861089618b311a98788ed9){:target="github"}_

---

→ <%= link_to_page "parklife", data: { controller: "hotkey", action: "keydown.right@document->hotkey#click" } %>

_← <%= link_to_page "rails-and-hotwire", data: { controller: "hotkey", action: "keydown.left@document->hotkey#click" } %>_
