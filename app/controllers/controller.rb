require_relative '../../config/application'
# require_relative '../../todo'
# require_relative '../view/display'

class Controller
  def process_input(input, display)
    command = input.first
    input.shift
    all_items = List.all
    flag = false

    case command
      when "add"
        text = input.join(" ")
        List.create(item: text, status: false)
        display.add_message(text)
      when "delete"
        n = input.first.to_i-1
        all_items.each_with_index do |item, count|
          if count == n
            text = item.item
            item.delete
            flag = true
            display.delete_message(text)
          end
        end
        display.item_doesnt_exist(n+1) if flag == false
      when "edit"
        n = input.first.to_i-1
        all_items.each_with_index do |item, count|
          if count == n
            input.shift
            text = input.join(" ")
            item.update(item: text)
            flag = true
            display.edit_message(n+1, text)
          end
        end
        display.item_doesnt_exist(n+1) if flag == false
      when "toggle"
        n = input.first.to_i-1
        all_items.each_with_index do |item, count|
          if count == n
            if item.status == true
              item.update(status: false)
              display.toggle_message(0)
            else
              item.update(status: true)
              display.toggle_message(1)
            end
            flag = true
          end
        end
        display.item_doesnt_exist(n+1) if flag == false
      when "list"
      else
        display.unknown_command_message
    end
  end
end