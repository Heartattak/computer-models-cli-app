class ComputerModelsCliApp::Computers

  attr_accessor :name, :price, :url

  def initialize(name, price, url)
    @name = name
    @url = url
    @price = price
  end
end
