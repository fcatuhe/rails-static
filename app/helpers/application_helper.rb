module ApplicationHelper
  def render_content_from(page)
    Kramdown::Document.new(page.content, input: "GFM").to_html.html_safe
  end
end
