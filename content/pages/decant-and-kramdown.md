---
title: Set up with Decant and Kramdown
position: 2
---

# <%= @page.title %>

> Decant is a dependency-free frontmatter-aware framework-agnostic wrapper around a directory of static content (probably Markdown).
>
> [Ben Pickles](https://www.benpickles.com/articles/95-introducing-decant){:target="decant"}

We are using Decant and Kramdown to parse our _static_ markdown content files, and go through Rails' router, controller, model and view.

### Install Decant and Kramdown

##### _Gemfile_

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

##### _app/models/page.rb_

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

##### _app/helpers/application_helper.rb_

```ruby
module ApplicationHelper
  def render_content_from(page)
    Kramdown::Document.new(page.content, input: "GFM").to_html.html_safe
  end
end
```

### Create the controller, view and routes

##### _app/controllers/pages_controller.rb_

```ruby
class PagesController < ApplicationController
  def show
    @page = Page.find(params[:slug])
  end
end
```

##### _app/views/pages/show.html.erb_

```erb
<%%= render_content_from @page %>
```

##### _config/routes.rb_

```ruby
Rails.application.routes.draw do
  ...
  root "pages#show", slug: "index"
  get "/*slug", to: "pages#show", as: :page
end
```

### Create a first static page

##### _content/pages/index.md_

```markdown
# Rails Static
```

### Launch the development server

```sh
dev
```

Visit [localhost:3000](http://localhost:3000){:target="dev"} to see the first static page.

### Add pages

To add a new web page, just create the corresponding markdown file in `content/pages/` folder. Pages can be nested in sub folders.

---

_Commit: [Decant and Kramdown](https://github.com/fcatuhe/rails-static/commit/343b28a2dbacc5e573861089618b311a98788ed9){:target="github"}_

---

→ <%= link_to_page "parklife" %>

_← <%= link_to_page "rails-and-hotwire" %>_
