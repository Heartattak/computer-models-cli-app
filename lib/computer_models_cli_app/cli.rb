#the controller

class ComputerModelsCliApp::CLI

  def call
    scraped_models
    models
    ends
  end

  def models
    puts "Looking for a laptop? No worries! Please select a model to see the price (1 - 16) or type Exit:"

    input = nil

    while input != "exit"
      input = gets.strip
      case input
    > when input
        puts "Sorry! Not in stores!"
      end
    end
  end

  def scraped_models

  end

  def ends
    puts "Goodbye!"
  end

end
