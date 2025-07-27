module ApplicationHelper
  def render_content_from(page)
    erb_processed_content = render(inline: page.content, layout: false)
    Kramdown::Document.new(erb_processed_content, input: "GFM").to_html.html_safe
  end
end
