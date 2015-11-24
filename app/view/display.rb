require_relative '../../config/application'
# require_relative '../controllers/controller.rb'
# require_relative '../../todo'

class Display

  def self.display_list
    List.all.each_with_index do |item, index|
      if item.status == true
        status = "[x]"
      else
        status = "[ ]"
      end

      print " " if index < 9
      puts "#{index+1}. #{status} #{item.item}"
    end
  end

  def self.interface
    print "\n= Yor Kul Tu Du Lis ===========================\n\n"
    puts "Commands: list, add, delete, edit, toggle\n\n"
    display_list
    print "\n================================ ( ^ o ^ ) ====\n"
  end

  def self.add_message(text)
    puts "Added \"#{text}\" into the list"
  end

  def self.delete_message(text)
    puts "\"#{text}\" deleted from the list"
  end

  def self.edit_message(number, text)
    puts "Edited item number #{number} to \"#{text}\""
  end

  def self.toggle_message(flag)
    puts "Item unchecked!" if flag == 0
    puts "Item checked!" if flag == 1
  end

  def self.item_doesnt_exist(number)
    puts "Item #{number} does not exist"
  end

  def self.unknown_command_message
    puts "Unknown command!"
  end
end