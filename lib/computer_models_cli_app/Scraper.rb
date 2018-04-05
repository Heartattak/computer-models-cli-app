class ComputerModelsCliApp::Scraper

  def scraped_page
    doc = Nokogiri::HTML(open("http://www.tigerdirect.com/applications/Category/guidedSearch.asp?CatId=17"))
    array = []
    doc.css("div.product").each do |model|
      name = model.css(".itemName a").text
      price = model.css("div.product.productAction.salePrice sup").text.to_i
      url = model.css("div.product.productInfo.itemName a")

      array << name
    end
    array
  end
end
