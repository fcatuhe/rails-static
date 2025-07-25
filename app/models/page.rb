Page = Decant.define(dir: "app/views/pages", ext: "md") do
  # Declare frontmatter convenience readers.
  frontmatter :title
  frontmatter :position

  # Add custom methods - it's a standard Ruby class.
  def shouty
    "#{title.upcase}!!!"
  end

  def html
    erb_parsed_content = PagesController.render(inline: content)
    Kramdown::Document.new(erb_parsed_content, input: "GFM").to_html
  end
end
