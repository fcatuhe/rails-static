---
title: Deploy with Parklife
position: 4
---

# Parklife

> Parklife is a Ruby library to render a Rack app (Rails/Sinatra/etc) to a static build ready to be served by GitHub Pages, Netlify, S3, Vercel, or any other server.
>
> [Ben Pickles](https://parklife.dev)

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

<%= image_tag "failure.png" %>

The repository needs to be configured to build and deploy Pages from Actions:

<%= image_tag "configure-github-pages.png" %>

And the GitHub Action triggered to re-run:

<%= image_tag "re-run.png" %>

### Voilà, the website is online!

<%= image_tag "rails-static.png" %>

---

_Commit: [Parklife](https://github.com/fcatuhe/rails-static/commit/ea61e280eb2f523c50075ee68a0ae78c487caa84){:target="github"}_

---

→ [Parse ERB](/erb)

_← [Set up with Decant and Kramdown](/decant-and-kramdown)_
