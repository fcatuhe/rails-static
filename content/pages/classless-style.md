---
title: Style pages with classless CSS
position: 10
---

# <%= @page.title %>

> Water.css is a drop-in collection of CSS styles to make simple websites like this just a little bit nicer.
> Now you can write your simple static site with nice semantic html, and Water.css will manage the styling for you.
>
> [Kognise](https://watercss.kognise.dev/){:target="watercss"}

### Install Water.css framework

##### _[app/views/layouts/application.html.erb](https://github.com/fcatuhe/rails-static/blob/379b4faeafc6ae615ac3e3bb89b5b7e8aea2aec6/app/views/layouts/application.html.erb#L20){:target="github"}_

```erb
<!DOCTYPE html>
<html>
  <head>
    ...

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/water.css@2/out/water.css">

    ...
  </head>

  ...
</html>
```

### Other options

This site is great to discover other classless CSS frameworks:
- [Drop-in switcher for previewing minimal CSS frameworks](https://dohliam.github.io/dropin-minimal-css){:target="dohliam"}

---

_Commit: [Classless style](https://github.com/fcatuhe/rails-static/commit/379b4faeafc6ae615ac3e3bb89b5b7e8aea2aec6){:target="github"}_

---

→ <%= link_to_page "rouge", data: { controller: "hotkey", action: "keydown.right@document->hotkey#click touch:swipe-right@window->hotkey#click" } %>

_← <%= link_to_page "next", data: { controller: "hotkey", action: "keydown.left@document->hotkey#click touch:swipe-left@window->hotkey#click" } %>_
