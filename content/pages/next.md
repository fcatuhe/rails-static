---
title: What next?
position: 9
---

# <%= @page.title %>

### Going further

Continue exploring additional features _- press C to continue_

- Styling
  - <%= link_to_page "classless-style", data: { controller: "hotkey", action: "keydown.c@document->hotkey#click" } %>
  - <%= link_to_page "rouge" %>
- SEO
  - <%= link_to_page "web-page-metadata" %>
  - <%= link_to_page "sitemap-and-robots" %>

### Ideas

- Add touch gestures for navigation → document commit [Touch controller](https://github.com/fcatuhe/rails-static/commit/e38e2da5e6eebacfad4189cee2b2a09f8bfec088){:target="github"}
- Update layout to add navigation bar in header, and refactor navigation in footer
- Deploy to a staging environment
- Experiment a very minimal Rails configuration
- ~~Strip Turbo down to Turbo Drive~~ discarded in [Turbo issue #136](https://github.com/hotwired/turbo/issues/136){:target="turbo"}
- Create a Rails Application Template
 
- Use [Rails on Wasm](https://web.dev/blog/ruby-on-rails-on-webassembly){:target="rails-on-wasm"} as a CMS in your browser that commits files to GitHub
- Create StaticRecord module to metaprogram content declaration

### Inspiration

- Ben Pickles: [Introducing Parklife](https://www.benpickles.com/articles/90-introducing-parklife){:target="ben-pickles"}
- Ben Sheldon: [Living Parklife with Rails, coming from Jekyll](https://island94.org/2025/01/living-parklife-with-rails-coming-from-jekyll){:target="ben-sheldon"}

### Contribute

- On [rails-static](https://github.com/fcatuhe/rails-static){:target="rails-static"} GitHub

---

_← <%= link_to_page "spark", data: { controller: "hotkey", action: "keydown.left@document->hotkey#click touch:swipe-left@window->hotkey#click" } %>_
