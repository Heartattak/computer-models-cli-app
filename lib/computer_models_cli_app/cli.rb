class ComputerModelsCliApp::CLI

  def call
    scraped_models
    models_choice
  end

  def scraped_models
    @models = ComputerModelsCliApp::Computers.collection
  end

  def models_choice
    input = nil

    while input == nil
      puts "Looking for a laptop? No worries! Please select a model to see the price (1 - 16), List to see the models, or type Exit:"

      input = gets.strip.downcase

      #need to think of ways to get all models secured for input
      case input
      when input = "exit"
        ends
      when "list"
        scraped_models
      else input != "exit"
        puts "Sorry! Not in stores!"
        models_choice
      end
    end
  end

  def ends
    puts "Goodbye!"
  end

end
