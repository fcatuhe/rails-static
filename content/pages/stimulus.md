---
title: Add interaction with Stimulus
position: 6
---

# <%= @page.title %>

> A modest JavaScript framework for the HTML you already have.
>
> _[Hotwire Stimulus](https://stimulus.hotwired.dev){:target="stimulus"}_

Stimulus connects JavaScript behavior to your HTML using simple data attributes. Controllers respond to DOM events and can interact with targets and values defined in your markup.

### Example: implement keyboard navigation

As an example of adding interaction, implement hotkeys to navigate faster between pages:

##### _[content/pages/stimulus.md](https://github.com/fcatuhe/rails-static/blob/b6170767207c038fe4e518a889d7cbcfdee4ffa0/content/pages/stimulus.md?plain=1#L49){:target="github"}_

```erb
...

→ <%%= link_to_page "importmap", data: { controller: "hotkey", action: "keydown.right@document->hotkey#click" } %>

_← <%%= link_to_page "turbo", data: { controller: "hotkey", action: "keydown.left@document->hotkey#click" } %>_
```

### Create the Stimulus controller

##### _[app/javascript/controllers/hotkey_controller.js](https://github.com/fcatuhe/rails-static/blob/b6170767207c038fe4e518a889d7cbcfdee4ffa0/app/javascript/controllers/hotkey_controller.js){:target="github"}_

```javascript
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  click(event) {
    event.preventDefault()
    this.element.click()
  }
}
```

Try it now with left and right keys!

---

_Commit: [Stimulus](https://github.com/fcatuhe/rails-static/commit/b6170767207c038fe4e518a889d7cbcfdee4ffa0){:target="github"}_

---

→ <%= link_to_page "importmap", data: { controller: "hotkey", action: "keydown.right@document->hotkey#click" } %>

_← <%= link_to_page "turbo", data: { controller: "hotkey", action: "keydown.left@document->hotkey#click" } %>_
