class ComputerModelsCliApp::Computers

  attr_accessor :price, :url

    @@all = []

  def self.new_from_page(i)
    self.new(
      i.css("div.product.productInfo.itemName a").text
    )
  end

  def initialize(price=nil, url=nil)
    @url = url
    @price = price
    @@all << self.new_from_page
  end

  def self.collection
    @@all
  end

  def price
    @price ||= doc.css("div.product.productAction.salePrice sup").text
  end

  def url
    @url ||= doc.css("div.product.productInfo.itemName a")
  end

  def scraped_computers_data
    @doc ||= Nokogiri::HTML(open("http://www.tigerdirect.com/applications/Category/guidedSearch.asp?CatId=17"))

  end



end
