require_relative '../../config/application'
# require_relative '../../todo'
# require_relative '../view/display'

class Controller
  def process_input(input)
    command = input.first
    input.shift
    all_items = List.all
    flag = false

    case command
      when "add"
        text = input.join(" ")
        List.create(item: text, status: false)
        screen.add_message(text)
      when "delete"
        n = input.first.to_i-1
        all_items.each_with_index do |item, count|
          if count == n
            text = item.item
            item.delete
            flag = true
            screen.delete_message(text)
          end
        end
        screen.item_doesnt_exist(n+1) if flag == false
      when "edit"
        n = input.first.to_i-1
        all_items.each_with_index do |item, count|
          if count == n
            input.shift
            text = input.join(" ")
            item.update(item: text)
            flag = true
            puts "Edited item number #{n+1} to #{text}"
          end
        end
        puts "Item #{n+1} does not exist" if flag == false
      when "toggle"
        n = input.first.to_i-1
        all_items.each_with_index do |item, count|
          if count == n
            if item.status == true
              item.update(status: false)
            else
              item.update(status: true)
            end
            flag = true
          end
        end
        puts "Item #{n+1} does not exist" if flag == false
      when "list"
      else
        puts "Unknown command"
    end
  end
end