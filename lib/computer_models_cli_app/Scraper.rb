class ComputerModelsCliApp::Scraper

  def scraped_page
    Nokogiri::HTML(open("http://www.tigerdirect.com/applications/Category/guidedSearch.asp?CatId=17"))
  end

  def index
    self.scraped_page.css("div.product")
  end

  def product
    index.each.with_index{ |model, i| ComputerModelsCliApp::Computers.new_from_page(model)}
  end

end
