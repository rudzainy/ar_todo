require_relative '../../config/application'
# require_relative '../../todo'
# require_relative '../view/display'

class Controller
  def self.process_input(input)
    command = input.first
    input.shift
    flag = false

    case command
      when "add"
        text = input.join(" ")
        List.create(item: text, status: false)
        Display.add_message(text)
      when "delete"
        n = input.first.to_i-1
        List.all.each_with_index do |item, count|
          if count == n
            text = item.item
            item.delete
            flag = true
            Display.delete_message(text)
          end
        end
        Display.item_doesnt_exist(n+1) if flag == false
      when "edit"
        n = input.first.to_i-1
        List.all.each_with_index do |item, count|
          if count == n
            input.shift
            text = input.join(" ")
            item.update(item: text)
            flag = true
            Display.edit_message(n+1, text)
          end
        end
        Display.item_doesnt_exist(n+1) if flag == false
      when "toggle"
        n = input.first.to_i-1
        List.all.each_with_index do |item, count|
          if count == n
            if item.status == true
              item.update(status: false)
              Display.toggle_message(0)
            else
              item.update(status: true)
              Display.toggle_message(1)
            end
            flag = true
          end
        end
        Display.item_doesnt_exist(n+1) if flag == false
      when "list"
      else
        Display.unknown_command_message
    end
  end
end