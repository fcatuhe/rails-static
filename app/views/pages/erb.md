---
title: Parse ERB
position: 5
---

# ERB

Let's update our Page model to parse ERB, before sending it to Kramdown.

##### _app/models/page.rb_

```ruby
Page = Decant.define(dir: "app/views/pages", ext: "md") do
  ...

  def html
    erb_parsed_content = PagesController.render(inline: content)
    Kramdown::Document.new(erb_parsed_content, input: "GFM").to_html
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

---

_Commit: [ERB](https://github.com/fcatuhe/rails-static/commit/c3238a4af477ac0d7986d89d0d0bd82d6d862371){:target="github"}_

---

_← [Deploy with Parklife](/parklife)_
