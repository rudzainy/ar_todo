require_relative '../../config/application'

class Display
  def self.initialize
  end

  def display_list(list)
    all_items = List.all
    counter = 0
    all_items.each do
      if status: == true
        status = "[x]"
      else
        status = "[ ]"
      end

      p "#{counter+1}. #{status} #{:text}"
      counter += 1
    end
  end

  def interface
    print "\n== ToDo List ===============\n"
    puts "Commands: add, delete, edit, toggle\n\n"
    display_list(:items)
    print "\n============================\n"
  end
end