---
title: Start with Rails and Hotwire
position: 1
---

# <%= @page.title %>

Install Rails, as well as Hotwire, and skip some unnecessary modules

```sh
rails new rails-static --skip-docker --skip-action-mailer --skip-action-mailbox --skip-action-text --skip-active-record --skip-active-job --skip-active-storage --skip-action-cable --skip-jbuilder --skip-test --skip-system-test --skip-thruster --skip-ci --skip-kamal --skip-solid
```

At the time of this guide, the installed versions where Ruby **3.4.5** and Rails **8.0.2**.

---

_Commit: [Rails and Hotwire](https://github.com/fcatuhe/rails-static/commit/21e4399611551edd30834e59b493525fc4359e95){:target="github"}_

---

→ <%= link_to_page "decant-and-kramdown" %>

_← <%= link_to_page "index" %>_
