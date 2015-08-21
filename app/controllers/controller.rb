require_relative '../../config/application'

class Controller
  def process_input(input)
    command = input.first
    input.shift

    case command
      when "add"
        List.create(item: input.join(" "))
      when "delete"
          input.sort!.reverse!
          input.each do |n|
            n = n.to_i
            List find
            if (n <= list.items.size)
              List.delete_item(n)
            else
              puts "Item #{n} does not exist"
            end
          end
      when "edit"
          n = input.first.to_i
        if (n <= list.items.size)
          input.shift
          text = input.join(" ")
          list.edit_item(n, text)
        else
          puts "Item #{n} does not exist"
        end
      when "toggle"
        n = input.first.to_i-1
        if (n <= list.items.size)
          list.items[n].toggle
        else
          puts "Item #{n} does not exist"
        end
      else
        puts "Unknown command"
    end
  end
end