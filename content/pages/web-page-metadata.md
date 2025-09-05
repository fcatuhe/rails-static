---
title: Optimize metadata for crawlers
position: 12
---

# <%= @page.title %>

Make your site discoverable by the World Wide Web (and its crawlers). Here are references that inspired the implementation documented below:

- [What's in the head? Web page metadata](https://developer.mozilla.org/en-US/docs/Learn_web_development/Core/Structuring_content/Webpage_metadata){:target="mdn"} _by_ mdn web docs
- [A Guide to Sharing for Webmasters](https://developers.facebook.com/docs/sharing/webmasters){:target="meta"} _by_ Meta for Developers
- [How to Favicon in 2025: Three files that fit most needs](https://evilmartians.com/chronicles/how-to-favicon-in-2021-six-files-that-fit-most-needs){:target="evil-martians"} _by_ Evil Martians

### Update the layout and create a partial for Open Graph meta tags

##### _[app/views/layouts/application.html.erb](https://github.com/fcatuhe/rails-static/blob/3d47d00cc914c819bfe322546bde73686dc0d7dd/app/views/layouts/application.html.erb#L11){:target="github"}_

```erb
<!DOCTYPE html>
<html>
  <head>
    <title><%%= title %></title>
    ...

    <%%= render 'layouts/og_meta_tags', tags: {
      title: title,
      description: description,
      image: image_url('og-image.jpg'),
      author: author,
      type: "website",
      site_name: site_name,
      url: canonical_url,
    } %>

    <%%= tag :link, rel: "canonical", href: canonical_url %>

    <%%= favicon_link_tag 'favicon.ico', sizes: '32x32' %>
    <%%= favicon_link_tag 'icon.svg', type: 'image/svg+xml' %>
    <%%= favicon_link_tag 'apple-touch-icon.png', rel: 'apple-touch-icon' %>

    <%%= tag :meta, name: "robots", content: robots_content %>

    ...

    # remove the previous favicon tags
    <link rel="icon" href="/icon.png" type="image/png">
    <link rel="icon" href="/icon.svg" type="image/svg+xml">
    <link rel="apple-touch-icon" href="/icon.png">

    ...
  </head>

  ...
</html>
```

##### _[app/views/layouts/_og_meta_tags.html.erb](https://github.com/fcatuhe/rails-static/blob/3d47d00cc914c819bfe322546bde73686dc0d7dd/app/views/layouts/_og_meta_tags.html.erb){:target="github"}_

```erb
<%%- tags.reject { |_key, content| content.blank? }.each do |key, content| %>
  <%%= og_meta_tag(key, content) %>
<%%- end %>
```

### Create helpers for the meta tag contents

##### _[app/helpers/application_helper.rb](https://github.com/fcatuhe/rails-static/blob/3d47d00cc914c819bfe322546bde73686dc0d7dd/app/helpers/application_helper.rb#L7){:target="github"}_

```ruby
module ApplicationHelper
  ...

  def site_name
    "Rails Static"
  end

  def title
    [ @page.title.presence, site_name ].uniq.compact.join(" · ")
  end

  def description
    @page.frontmatter&.dig(:description)
  end

  def author
    "François Catuhe"
  end

  def canonical_url
    url_for(only_path: false)
  end

  def robots_content
    Rails.env.production? ? "index, follow" : "noindex, nofollow"
  end

  def og_meta_tag(key, content)
    case key
    when :title, :description, :image
      tag(:meta, name: key, property: "og:#{key}", content: content)
    when :author
      tag(:meta, name: key, content: content)
    else
      tag(:meta, property: "og:#{key}", content: content)
    end
  end
end
```

### Create favicons and images

In `app/assets/images/`:

- Create 3 icon files:
  - [`favicon.ico`](https://github.com/fcatuhe/rails-static/blob/3d47d00cc914c819bfe322546bde73686dc0d7dd/app/assets/images/favicon.ico){:target="github"} _· 32 ✗ 32 px_
  - [`icon.svg`](https://github.com/fcatuhe/rails-static/blob/3d47d00cc914c819bfe322546bde73686dc0d7dd/app/assets/images/icon.svg){:target="github"}
  - [`apple-touch-icon.png`](https://github.com/fcatuhe/rails-static/blob/3d47d00cc914c819bfe322546bde73686dc0d7dd/app/assets/images/apple-touch-icon.png){:target="github"} _· 180 ✗ 180 px_
- Create an open graph image:
  - [`og-image.jpg`](https://github.com/fcatuhe/rails-static/blob/3d47d00cc914c819bfe322546bde73686dc0d7dd/app/assets/images/og-image.jpg){:target="github"} _· 1200 ✗ 630 px_

In `public/`:

- Add [`favicon.ico`](https://github.com/fcatuhe/rails-static/blob/3d47d00cc914c819bfe322546bde73686dc0d7dd/public/favicon.ico){:target="github"} _· for legacy browsers_
- Remove the unused `icon.png` and `icon.svg`

---

_Commit: [Web page metadata](https://github.com/fcatuhe/rails-static/commit/3d47d00cc914c819bfe322546bde73686dc0d7dd){:target="github"}_

---

→ <%= link_to_page "sitemap-and-robots", data: { controller: "hotkey", action: "keydown.right@document->hotkey#click touch:swipe-right@window->hotkey#click" } %>

_← <%= link_to_page "rouge", data: { controller: "hotkey", action: "keydown.left@document->hotkey#click touch:swipe-left@window->hotkey#click" } %>_
