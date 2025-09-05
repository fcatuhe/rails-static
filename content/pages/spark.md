---
title: Enable live-reloading with Spark
position: 8
---

# <%= @page.title %>

> Hotwire Spark is a live-reloading system for Hotwire applications. It enhances your development feedback loop by detecting source code changes and updating the page smoothly without requiring a manual reload.
>
> _[Jorge Manrubia](https://github.com/hotwired/spark){:target="spark"}_

### Install and configure Hotwire Spark

##### _[Gemfile](https://github.com/fcatuhe/rails-static/blob/df850b488f9068112f64dde417ec6a8a62706833/Gemfile#L45){:target="github"}_

```ruby
...

group :development do
  ...

  gem "hotwire-spark"
end
```

```sh
bundle
```

##### _[config/environments/development.rb](https://github.com/fcatuhe/rails-static/blob/df850b488f9068112f64dde417ec6a8a62706833/config/environments/development.rb#L46){:target="github"}_

```ruby
...

Rails.application.configure do
  ...

  config.hotwire.spark.html_paths += %w[ content ]
  config.hotwire.spark.html_extensions += %w[ md ]
end
```

### Configure Action Cable

Uncomment action cable engine from Rails configuration:

##### _[config/application.rb](https://github.com/fcatuhe/rails-static/blob/df850b488f9068112f64dde417ec6a8a62706833/config/application.rb#L14){:target="github"}_

```ruby
...
require "action_cable/engine"
...
```

Create the cable configuration file:

##### _[config/cable.yml](https://github.com/fcatuhe/rails-static/blob/df850b488f9068112f64dde417ec6a8a62706833/config/cable.yml){:target="github"}_

```yaml
development:
  adapter: async
```

Restart the development server to apply the new configuration.

---

_Commit: [Hotwire Spark](https://github.com/fcatuhe/rails-static/commit/df850b488f9068112f64dde417ec6a8a62706833){:target="github"}_

---

→ <%= link_to_page "next", data: { controller: "hotkey", action: "keydown.right@document->hotkey#click touch:swipe-right@window->hotkey#click" } %>

_← <%= link_to_page "importmap", data: { controller: "hotkey", action: "keydown.left@document->hotkey#click touch:swipe-left@window->hotkey#click" } %>_
