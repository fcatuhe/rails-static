---
title: Set up with Decant and Kramdown
position: 3
---

# Decant and Kramdown

> Decant is a dependency-free frontmatter-aware framework-agnostic wrapper around a directory of static content (probably Markdown).
>
> _[Ben Pickles](https://www.benpickles.com/articles/95-introducing-decant)_

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

### Create a Page model that configures Decant and Kramdown

##### _app/models/page.rb_

```ruby
Page = Decant.define(dir: "app/views/pages", ext: "md") do
  # Declare frontmatter convenience readers.
  frontmatter :title

  # Add custom methods - it's a standard Ruby class.
  def shouty
    "#{title.upcase}!!!"
  end

  def html
    Kramdown::Document.new(content, input: "GFM").to_html
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
<%%== @page.html %>
```

##### _config/routes.rb_

```ruby
Rails.application.routes.draw do
  ...
  root "pages#show", slug: "index"
  get "/*slug", to: "pages#show"
end
```

### Create a first static page

##### _app/views/pages/index.md_

```markdown
# Rails Static
```

### Launch the development server

```sh
dev
```

Visit [localhost:3000](http://localhost:3000){:target="dev"} to see the first static page.

### Add pages

To add a new web page, just create the corresponding markdown file in `app/views/pages/` folder. Pages can be nested in sub folders.

---

_Commit: [Decant and Kramdown](https://github.com/fcatuhe/rails-static/commit/7ecfaaa7f58cf30c1c3dbd0fa1cf2fc09d552cb0){:target="github"}_

---

→ [Deploy with Parklife](/parklife)

_← [Start with Rails and Hotwire](/rails-and-hotwire)_
