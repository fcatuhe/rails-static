---
title: Accelerate with Turbo
position: 5
---

# <%= @page.title %>

> The speed of a single-page web application without having to write any JavaScript.
>
> _[Hotwire Turbo](https://turbo.hotwired.dev){:target="turbo"}_

Did you notice how our pages get _replaced_ without triggering a full reload? Or even, how the next page is prefetched when we hover on links?

<%= pages_image_tag "network.png", title: "Browser developer tools Network tab showing prefetch requests triggered on hover and fast page loads without full refresh" %>

---

→ <%= link_to_page "stimulus" %>

_← <%= link_to_page "erb" %>_
