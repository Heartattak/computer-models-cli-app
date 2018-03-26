class ComputerModelsCliApp::CLI

  def call
    scraped_models
    models_choice
  end

  def scraped_models
    scraped_model = ComputerModelsCliApp::Scraper.new.product
    binding.pry
      scraped_model.each.with_index do |model, i|
        puts "#{i}. #{model}"
    end
  end

  def models_choice
    input = nil

    puts "Looking for a laptop? No worries! Please select a model to see the price (1 - 16), List to see the models, or type Exit:"

    while input != "exit"

      input = gets.strip.downcase

      if input.to_i > 16
        puts "Sorry! Not in stores!"
      elsif input.to_i > 0
        the_model = @models[input.to_i-1]
        puts "#{the_model}, #{the_model.price}, #{the_model.url}"
      elsif input == "exit"
        ends
      elsif input == "list"
        scraped_models
        puts "Looking for a laptop? No worries! Please select a model to see the price (1 - 16), List to see the models, or type Exit:"
      else
        puts "Sorry! Not in stores!"
      end
    end
  end

  #def ends
    #puts "Goodbye!"
  #end

end
