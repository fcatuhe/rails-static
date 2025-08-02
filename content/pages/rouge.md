---
title: Highlight code with Rouge
position: 11
---

# <%= @page.title %>

> Rouge is a pure Ruby syntax highlighter. It can highlight over 200 different languages, and output HTML or ANSI 256-color text. Its HTML output is compatible with stylesheets designed for Pygments.
>
> [Rouge](https://github.com/rouge-ruby/rouge){:target="rouge"}

### Install Rouge

##### _[Gemfile](https://github.com/fcatuhe/rails-static/blob/9820d8c7fc5b01dac968db123347d440b70a10ee/Gemfile#L29){:target="github"}_

```ruby
...
gem "rouge"

...
```

```sh
bundle
```

### Configure Rouge in kramdown

##### _[app/helpers/application_helper.rb](https://github.com/fcatuhe/rails-static/blob/9820d8c7fc5b01dac968db123347d440b70a10ee/app/helpers/application_helper.rb#L4){:target="github"}_

```ruby
module ApplicationHelper
  def render_content_from(page)
    erb_processed_content = render(inline: page.content, layout: false)
    Kramdown::Document.new(erb_processed_content, input: "GFM", syntax_highlighter: :rouge).to_html.html_safe
  end
end
```

### Generate a CSS stylesheet

```bash
rougify style github > app/assets/stylesheets/rouge.css
```

- [app/assets/stylesheets/rouge.css](https://github.com/fcatuhe/rails-static/blob/9820d8c7fc5b01dac968db123347d440b70a10ee/app/assets/stylesheets/rouge.css){:target="github"}

---

_Commit: [Rouge](https://github.com/fcatuhe/rails-static/commit/9820d8c7fc5b01dac968db123347d440b70a10ee){:target="github"}_

---

→ <%= link_to_page "web-page-metadata", data: { controller: "hotkey", action: "keydown.right@document->hotkey#click" } %>

_← <%= link_to_page "classless-style", data: { controller: "hotkey", action: "keydown.left@document->hotkey#click" } %>_
