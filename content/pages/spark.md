---
title: Spark some developer joy
position: 8
---

# <%= @page.title %>

> Hotwire Spark is a live-reloading system for Hotwire applications. It enhances your development feedback loop by detecting source code changes and updating the page smoothly without requiring a manual reload.
>
> _[Jorge Manrubia](https://github.com/hotwired/spark){:target="spark"}_

### Install and configure Hotwire Spark

##### _Gemfile_

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

##### _config/environment/development.rb_

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

##### _config/application.rb_

```ruby
...
require "action_cable/engine"
...
```

Create the cable configuration file:

##### _config/cable.yml_

```yaml
development:
  adapter: async
```

Restart your development server for the new configuration to be taken into account.

---

_Commit: [Hotwire Spark](https://github.com/fcatuhe/rails-static/commit/df850b488f9068112f64dde417ec6a8a62706833){:target="github"}_

---

→ <%= link_to_page "next", data: { controller: "hotkey", action: "keydown.right@document->hotkey#click" } %>

_← <%= link_to_page "importmap", data: { controller: "hotkey", action: "keydown.left@document->hotkey#click" } %>_
