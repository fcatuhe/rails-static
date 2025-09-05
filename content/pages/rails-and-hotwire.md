---
title: Start with Rails and Hotwire
position: 1
---

# <%= @page.title %>

> Compress the complexity of modern web apps.
>
> _[Ruby on Rails](https://rubyonrails.org){:target="rails"}_

> Hotwire is an alternative approach to building modern web applications without using much JavaScript by sending HTML instead of JSON over the wire.
>
> _[Hotwire](https://hotwired.dev/){:target="hotwire"}_


### Install Rails with Hotwire

Install Rails, skip unnecessary modules for static site generation:

```sh
rails new rails-static --skip-docker --skip-action-mailer --skip-action-mailbox --skip-action-text --skip-active-record --skip-active-job --skip-active-storage --skip-action-cable --skip-jbuilder --skip-test --skip-system-test --skip-thruster --skip-ci --skip-kamal --skip-solid
```

At the time of this guide, the installed versions where Ruby **3.4.5** and Rails **8.0.2**.

---

_Commit: [Rails and Hotwire](https://github.com/fcatuhe/rails-static/commit/21e4399611551edd30834e59b493525fc4359e95){:target="github"}_

---

→ <%= link_to_page "decant-and-kramdown", data: { controller: "hotkey", action: "keydown.right@document->hotkey#click touch:swipe-right@window->hotkey#click" } %>

_← <%= link_to_page "index", data: { controller: "hotkey", action: "keydown.left@document->hotkey#click touch:swipe-left@window->hotkey#click" } %>_
