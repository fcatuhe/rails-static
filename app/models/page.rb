Page = Decant.define(dir: "content/pages", ext: "md") do
  # Declare frontmatter convenience readers.
  frontmatter :title
  frontmatter :position

  # Add custom methods - it's a standard Ruby class.
  def shouty
    "#{title.upcase}!!!"
  end
end
