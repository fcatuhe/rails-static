---
title: Manage dependencies with Importmap
position: 7
---

# <%= @page.title %>

> Import maps let you import JavaScript modules using logical names that map to versioned/digested files – directly from the browser. So you can build modern JavaScript applications using JavaScript libraries made for ES modules (ESM) without the need for transpiling or bundling. This frees you from needing Webpack, Yarn, npm, or any other part of the JavaScript toolchain. All you need is the asset pipeline that's already included in Rails.
>
> _[importmap-rails](https://github.com/rails/importmap-rails){:target="importmap-rails"}_

Importmap allows you to add JavaScript libraries to your Rails application without complex build tools. Simply pin external modules to CDN URLs and import them directly in your JavaScript files.

### Example: add canvas-confetti library

As an example of managing dependencies, import the canvas-confetti library and configure it with Stimulus:

##### _[config/importmap.rb](https://github.com/fcatuhe/rails-static/blob/8f8d12037a9d8847a395919c07b18b5538405f9e/config/importmap.rb#L9){:target="github"}_

```ruby
...

pin "canvas-confetti", to: "https://cdn.jsdelivr.net/npm/canvas-confetti@1/dist/confetti.module.mjs"
```

##### _[app/javascript/controllers/confetti_controller.js](https://github.com/fcatuhe/rails-static/blob/8f8d12037a9d8847a395919c07b18b5538405f9e/app/javascript/controllers/confetti_controller.js){:target="github"}_

```javascript
import { Controller } from "@hotwired/stimulus"
import confetti from "canvas-confetti"

export default class extends Controller {
  connect() {
    this.confetti = confetti

    this.observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          this.celebrate()
        }
      })
    }, {
      threshold: 1.0,
      rootMargin: '-10% 0px'
    })

    this.observer.observe(this.element)
  }

  disconnect() {
    this.observer.disconnect()
    this.confetti.reset()
  }

  celebrate() {
    const { x, y } = this.getElementCenter(this.element)
    this.fireConfetti(x, y)
  }

  getElementCenter(element) {
    const rect = element.getBoundingClientRect()
    return {
      x: (rect.left + rect.width / 2) / window.innerWidth,
      y: (rect.top + rect.height / 2) / window.innerHeight
    }
  }

  fireConfetti(x, y) {
    this.confetti({
      particleCount: 100,
      angle: 135,
      spread: 45,
      origin: { x, y },
      colors: ['#0055A4']
    })

    this.confetti({
      particleCount: 100,
      angle: 90,
      spread: 70,
      origin: { x, y },
      colors: ['#FFFFFF']
    })

    this.confetti({
      particleCount: 100,
      angle: 45,
      spread: 45,
      origin: { x, y },
      colors: ['#EF4135']
    })
  }
}
```

Test the confetti animation:

##### _[content/pages/importmap.md](https://github.com/fcatuhe/rails-static/blob/8f8d12037a9d8847a395919c07b18b5538405f9e/content/pages/importmap.md?plain=1#L106){:target="github"}_

```erb
...

<button data-controller="confetti hotkey" data-action="confetti#celebrate keydown.c@document->hotkey#click" style="display: block; margin: auto; background-color: #0055A4; color: white;" >
  🎉 Celebrate! 🎉
</button>

...
```

<button data-controller="confetti hotkey" data-action="confetti#celebrate keydown.c@document->hotkey#click" style="display: block; margin: auto; background-color: #0055A4; color: white;" >
  🎉 Celebrate! 🎉
</button>

---

_Commit: [Importmap](https://github.com/fcatuhe/rails-static/commit/8f8d12037a9d8847a395919c07b18b5538405f9e){:target="github"}_

---

→ <%= link_to_page "spark", data: { controller: "hotkey", action: "keydown.right@document->hotkey#click" } %>

_← <%= link_to_page "stimulus", data: { controller: "hotkey", action: "keydown.left@document->hotkey#click" } %>_
