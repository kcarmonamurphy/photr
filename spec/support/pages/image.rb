require 'support/page'

class ImagePage < Page

  def initialize(image)
    @image = image
  end

  def visit_page
    visit "path/#{@image.url}"
  end
end
