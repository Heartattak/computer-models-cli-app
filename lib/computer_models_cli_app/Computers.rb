class ComputerModelsCliApp::Computers

  attr_accessor :name, :price, :url

  @@all = []

  def save
    @@all << self
  end

  def self.models
    @@all
  end

  def initialize(name, url, price)
    @name = name
    @url = url
    @price = price
  end
end
