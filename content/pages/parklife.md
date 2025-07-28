---
title: Deploy with Parklife
position: 3
---

# <%= @page.title %>

> Parklife is a Ruby library to render a Rack app (Rails/Sinatra/etc) to a static build ready to be served by GitHub Pages, Netlify, S3, Vercel, or any other server.
>
> [Ben Pickles](https://parklife.dev){:target="parklife"}

### Install Parklife

##### _Gemfile_

```ruby
...
gem "parklife"

...
```

```sh
bundle
```

### Initialize for Rails and GitHub Pages

```sh
bundle exec parklife init --rails --github-pages
```

### Deploy on GitHub Pages

Commit all changes first.

Create a public GitHub repository and push the local commits. With [GitHub CLI](https://cli.github.com){:target="github-cli"} installed:

```sh
gh repo create rails-static --public --source=. --remote=origin --push
```

The GitHub action will fail:

<%= pages_image_tag "failure.png", title: "GitHub Actions workflow showing failed deployment with red X mark" %>

The repository needs to be configured to build and deploy Pages from Actions:

<%= pages_image_tag "configure-github-pages.png", title: "GitHub repository settings page showing Pages configuration with 'Build and deployment' section set to 'GitHub Actions' source" %>

And the GitHub Action triggered to re-run:

<%= pages_image_tag "re-run.png", title: "GitHub Actions page with 'Re-run all jobs' button highlighted to retry the failed workflow" %>

### Voilà, the website is online!

<%= pages_image_tag "rails-static.png", title: "Successfully deployed Rails Static website showing the homepage with title and navigation" %>

---

_Commit: [Parklife](https://github.com/fcatuhe/rails-static/commit/89be109ebe531b925134779598849eec8b4245f9){:target="github"}_

---

→ <%= link_to_page "erb", data: { controller: "hotkey", action: "keydown.right@document->hotkey#click" } %>

_← <%= link_to_page "decant-and-kramdown", data: { controller: "hotkey", action: "keydown.left@document->hotkey#click" } %>_
