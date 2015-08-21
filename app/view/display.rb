require_relative '../../config/application'

class Display
  def self.initialize
  end

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
end