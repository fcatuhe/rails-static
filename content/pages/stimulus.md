---
title: Dance with Stimulus
position: 6
---

# <%= @page.title %>

> A modest JavaScript framework for the HTML you already have.
>
> _[Hotwire Stimulus](https://stimulus.hotwired.dev){:target="stimulus"}_

Let's implement hotkeys, to navigate even faster between pages!

We want to use it this way:

##### _content/pages/stimulus.md_

```erb
...

→ <%%= link_to_page "importmap", data: { controller: "hotkey", action: "keydown.right@document->hotkey#click" } %>

_← <%%= link_to_page "turbo", data: { controller: "hotkey", action: "keydown.left@document->hotkey#click" } %>_
```

Create the Stimulus controller:

##### _app/javascript/controllers/hotkey_controller.js_

```javascript
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  click(event) {
    event.preventDefault()
    this.element.click()
  }
}
```

... and start dancing your fingers on the keyboard!

---

_Commit: [Stimulus](){:target="github"}_

---

→ <%= link_to_page "importmap" %>

_← <%= link_to_page "turbo" %>_
