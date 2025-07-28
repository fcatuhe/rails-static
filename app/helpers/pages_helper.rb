module PagesHelper
  def link_to_page(slug, html_options = nil)
    link_to Page.find(slug).title, page_path(slug), html_options
  end

  def pages_image_tag(path, options = {})
    image_tag "pages/#{@page.slug}/#{path}", options
  end
end
