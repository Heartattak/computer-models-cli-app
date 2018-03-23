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

    while input != "exit"
      puts "Looking for a laptop? No worries! Please select a model to see the price (1 - 16), List to see the models, or type Exit:"

      input = gets.strip.downcase

      #need to think of ways to get all models secured for input
      if input.to_i > 0
        puts @models[input.to_i-1]
      elsif input == "exit"
        ends
      elsif input == "list"
        scraped_models
      else
        puts "Sorry! Not in stores!"
      end
    end
  end

  def ends
    puts "Goodbye!"
  end

end
