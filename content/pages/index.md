---
title: Rails Static
position: 0
---

# <%= @page.title %>

_Generate static sites with Rails · a step by step guide_

### Another framework?

The Ruby ecosystem offers many static site generators - [Jekyll](https://jekyllrb.com){:target="jekyll"}, [Middleman](https://middlemanapp.com){:target="middleman"}, [Kamal Skiff](https://github.com/basecamp/kamal-skiff){:target="skiff"}, [Sitepress](https://sitepress.cc){:target="sitepress"}, [Bridgetown](https://www.bridgetownrb.com/){:target="bridgetown"}, [High Voltage](https://thoughtbot.github.io/high_voltage){:target="high-voltage"}, [Nanoc](https://nanoc.app){:target="nanoc"}, ... - and countless more exist beyond Ruby.

The intent here is **to remove one** - to use Rails and all its magic goodies for both dynamic and static sites.

This is not a new framework. It's a thoughtful collection of existing gems that each excel at one task and integrate seamlessly with Rails.

This very website is generated using this approach - let's learn how to build and deploy it together!

→ <%= link_to_page "rails-and-hotwire", data: { controller: "hotkey", action: "keydown.right@document->hotkey#click" } %>

---

#### What you will learn

This guide will teach you how to transform Rails into a powerful static site generator, leveraging a modern Hotwire stack. You will discover how to:

- Create a minimal Rails application optimized for static site generation
- Process markdown content with frontmatter using Decant and Kramdown
- Use ERB template processing for dynamic content generation
- Deploy automatically to GitHub Pages with Parklife
- Enhance user experience with Turbo Drive for instant page navigation
- Add interactive features using Stimulus controllers
- Manage JavaScript dependencies with Importmap for modern ES modules
- Implement live-reloading during development with Hotwire Spark

#### What you need

Before starting, you should have:

- Basic knowledge of Ruby and Rails
- Ruby 3.4+ and Rails 8+ installed on your system
- A GitHub account for repository hosting and Pages deployment
- Familiarity with Markdown syntax for content creation
- Basic understanding of JavaScript

→ <%= link_to_page "rails-and-hotwire" %>
