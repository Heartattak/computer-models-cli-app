class ComputerModelsCliApp::Computers

  attr_accessor :price, :url

    @@all = []

  def initialize(price=nil, url=nil)
    @url = url
    @price = price
    @@all << self
  end

  def self.new_from_page(i)
    self.new(
      i.css("div.product.productInfo.itemName a").text
    )
  end

  def self.collection
    @@all
  end

  def self.find(f)
    self.collection[f-1]
  end

  def price
    @price ||= doc.css("div.product.productAction.salePrice sup").text
  end

  def url
    @url ||= doc.css("div.product.productInfo.itemName a")
  end



end
