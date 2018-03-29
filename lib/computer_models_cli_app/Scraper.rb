class ComputerModelsCliApp::Scraper

  def scraped_page
    Nokogiri::HTML(open("http://www.tigerdirect.com/applications/Category/guidedSearch.asp?CatId=17"))
  end

  def index
    self.scraped_page.css("div.product")
  end

  #def product
    #ComputerModelsCliApp::Computers.new_from_page(index)
  #end

end
