class ComputerModelsCliApp::Scraper

  def scraped_page
    doc = Nokogiri::HTML(open("http://www.tigerdirect.com/applications/Category/guidedSearch.asp?CatId=17"))
    array = []
    doc.css("div.product").each do |model|
      computer = ComputerModelsCliApp::Computers.new
      computer.name = model.css(".itemName a").text
      computer.price = model.css(".salePrice sup").text
      computer.url = model.css(".itemName a").attribute("href")

      computer.save
    end
  end
end
