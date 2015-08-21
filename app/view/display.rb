require_relative '../../config/application'

class Display
  def display_list(list)
    list.each_with_index do |element, i|
      if (element.done)
        status = "[x]"
      else
        status = "[ ]"
      end

      p "#{i+1}. #{status} #{element.text}"
    end
  end

  def interface
    print "\n== ToDo List ===============\n"
    puts "Commands: add, delete, edit, toggle\n\n"
    display_list(:items)
    print "\n============================\n"
  end
end