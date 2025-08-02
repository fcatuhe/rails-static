---
title: Rails Static
description: A thoughtful collection of gems to use Rails and all its magic goodies for static site generation.
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
- Process markdown content with frontmatter using [Decant](https://www.benpickles.com/articles/95-introducing-decant){:target="decant"} and [kramdown](https://kramdown.gettalong.org){:target="kramdown"}
- Deploy automatically to GitHub Pages with [Parklife](https://parklife.dev){:target="parklife"}
- Use ERB template processing for dynamic content generation within markdown files
- Enhance user experience with [Turbo](https://turbo.hotwired.dev){:target="turbo"} Drive for instant page navigation
- Add interactive features using [Stimulus](https://stimulus.hotwired.dev){:target="stimulus"} controllers
- Manage JavaScript dependencies with [Importmap](https://github.com/rails/importmap-rails){:target="importmap-rails"} for modern ES modules
- Implement live-reloading during development with [Hotwire Spark](https://github.com/hotwired/spark){:target="spark"}
- Style your site effortlessly with classless CSS frameworks
- Add syntax highlighting to code blocks with [Rouge](https://github.com/rouge-ruby/rouge){:target="rouge"}
- Optimize for SEO with proper web page metadata and Open Graph tags
- Generate XML sitemaps and robots.txt files for search engines

#### What you need

Before starting, you should have:

- Basic knowledge of Ruby and Rails
- Ruby 3.4+ and Rails 8.0+ installed on your system
- A GitHub account for repository hosting and Pages deployment
- Familiarity with Markdown syntax for content creation
- Basic understanding of JavaScript and CSS
- GitHub CLI installed (optional, for easier repository setup)

→ <%= link_to_page "rails-and-hotwire" %>

---

#### About

This guide and website were created by [François Catuhe](https://github.com/fcatuhe){:target="francois"} and are available on [GitHub](https://github.com/fcatuhe/rails-static){:target="github"}.
