class ComputerModelsCliApp::Scraper

  def scraped_page
    doc = Nokogiri::HTML(open("http://www.tigerdirect.com/applications/Category/guidedSearch.asp?CatId=17"))
    array = []
    doc.css("div.product").each do |model|
      computer = ComputerModelsCliApp::Computers.new
      computer.name = model.css(".itemName a").text
      price = model.css(".salePrice").children[4].text
      if(price == " ")
        price = model.css(".salePrice sup #text")
      end

      computer.price = "$" + price + model.css(".salePrice").children[5].text


      computer.url = "http://www.tigerdirect.com/applications" + model.css(".itemName a").attribute("href").text.gsub("..", "")

      computer.save
    end
  end
end
