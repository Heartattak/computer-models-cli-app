class ComputerModelsCliApp::Scraper

  def scraped_page
    doc = Nokogiri::HTML(open("http://www.tigerdirect.com/applications/Category/guidedSearch.asp?CatId=17"))
    array = []
    doc.css("div.product").each do |model|
      name = model.css(".itemName a").text
      price = model.css(".salePrice").children[4].text
      if(price == " ")
        price = model.css(".salePrice sup #text")
      end

      price = "$" + price + model.css(".salePrice").children[5].text


      url = "http://www.tigerdirect.com/applications" + model.css(".itemName a").attribute("href").text.gsub("..", "")
      computer = ComputerModelsCliApp::Computers.new(name, url, price)
      computer.save
    end
  end
end
