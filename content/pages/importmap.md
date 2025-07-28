---
title: Celebrate with Importmap
position: 7
---

# <%= @page.title %>

> Import maps let you import JavaScript modules using logical names that map to versioned/digested files – directly from the browser. So you can build modern JavaScript applications using JavaScript libraries made for ES modules (ESM) without the need for transpiling or bundling. This frees you from needing Webpack, Yarn, npm, or any other part of the JavaScript toolchain. All you need is the asset pipeline that's already included in Rails.
>
> _[importmap-rails](https://github.com/rails/importmap-rails){:target="importmap-rails"}_

Let's import a JavaScript dependency, then configure it with Stimulus:

##### _config/importmap.rb_

```ruby
...

pin "canvas-confetti", to: "https://cdn.jsdelivr.net/npm/canvas-confetti@1/dist/confetti.module.mjs"
```

##### _app/javascript/controllers/confetti_controller.js_

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

... and start celebrating!

##### _content/pages/importmap.md_

```erb
...

<button data-controller="confetti hotkey" data-action="confetti#celebrate keydown.c@document->hotkey#click" style="display: block; margin: auto; background-color: #0055A4; color: white;" >
  🎉 Celebrate! 🎉
</button>

...
```

---

_Commit: [Importmap](){:target="github"}_

---

_← <%= link_to_page "stimulus" %>_
