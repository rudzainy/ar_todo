require_relative '../../config/application'
# require_relative '../controllers/controller.rb'
# require_relative '../../todo'

class Display

  def display_list(list)
    all_items = List.all
    counter = 0
    all_items.each do |item|
      if item.status == true
        status = "[x]"
      else
        status = "[ ]"
      end

      puts "#{counter+1}. #{status} #{item.item}"
      counter += 1
    end
  end

  def interface
    print "\n= Yor Kul Tu Du Lis ========\n"
    puts "Commands: list, add, delete, edit, toggle\n\n"
    display_list(:items)
    print "\n============================\n"
  end

  def add_message(text)
    puts "Added #{text} into the list"
  end

  def delete_message(text)
    puts "#{text}deleted from the list"
  end

  def item_doesnt_exist(number)
    puts "Item #{number} does not exist"
  end
end