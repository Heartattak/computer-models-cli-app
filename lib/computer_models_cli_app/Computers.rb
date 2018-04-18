class ComputerModelsCliApp::Computers

  attr_accessor :name, :price, :url

  @@all = []

  def save
    @@all << self
  end

  def print_models
    @@all
  end

  def initialize
    @name = name
    @url = url
    @price = price
  end
end
