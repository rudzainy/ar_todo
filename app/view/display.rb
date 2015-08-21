require_relative '../../config/application'
# require_relative '../controllers/controller.rb'
# require_relative '../../todo'

class Display

  def self.display_list
    counter = 0
    List.all.each do |item|
      if item.status == true
        status = "[x]"
      else
        status = "[ ]"
      end

      puts "#{counter+1}. #{status} #{item.item}"
      counter += 1
    end
  end

  def self.interface
    print "\n= Yor Kul Tu Du Lis ===========================\n\n"
    puts "Commands: list, add, delete, edit, toggle\n\n"
    display_list
    print "\n================================ ( ^ o ^ ) ====\n"
  end

  def add_message(text)
    puts "Added #{text} into the list"
  end

  def delete_message(text)
    puts "#{text} deleted from the list"
  end

  def edit_message(number, text)
    puts "Edited item number #{number} to #{text}"
  end

  def toggle_message(flag)
    puts "Item unchecked!" if flag == 0
    puts "Item checked!" if flag == 1
  end

  def item_doesnt_exist(number)
    puts "Item #{number} does not exist"
  end

  def unknown_command_message
    puts "Unknown command!"
  end
end