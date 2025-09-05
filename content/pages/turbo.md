---
title: Accelerate with Turbo
position: 5
---

# <%= @page.title %>

> The speed of a single-page web application without having to write any JavaScript.
>
> _[Hotwire Turbo](https://turbo.hotwired.dev){:target="turbo"}_

Notice how pages get _replaced_ without triggering a full reload, and how the next page is prefetched when hovering on links:

<%= pages_image_tag "network.png", title: "Browser developer tools Network tab showing prefetch requests triggered on hover and fast page loads without full refresh" %>

---

→ <%= link_to_page "stimulus", data: { controller: "hotkey", action: "keydown.right@document->hotkey#click touch:swipe-right@window->hotkey#click" } %>

_← <%= link_to_page "erb", data: { controller: "hotkey", action: "keydown.left@document->hotkey#click touch:swipe-left@window->hotkey#click" } %>_
