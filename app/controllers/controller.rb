require_relative '../../config/application'

class Controller
  def process_input(input)
    command = input.first
    input.shift
    all_items = List.all
    flag = false

    case command
      when "add"
        List.create(item: input.join(" "))
      when "delete"
        n = input.first.to_i-1
        all_items.each_with_index do |item, count|
          if count == n
            item.delete
            flag = true
          end
        end
        puts "Item #{n+1} does not exist" if flag == false
      when "edit"
          n = input.first.to_i-1
        if (n <= all_items.items.size)
          input.shift
          text = input.join(" ")
          list.edit_item(n, text)
        else
          puts "Item #{n} does not exist"
        end
      when "toggle"
        n = input.first.to_i-1
        all_items.each_with_index do |item, count|
          if count == n
            item.status.toggle
          else
            puts "Item #{n+1} does not exist"
          end
        end
      else
        puts "Unknown command"
    end
  end
end