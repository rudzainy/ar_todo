require_relative '../../config/application'

class Controller
  def process_input(input)
    command = input.first
    input.shift
    all_items = List.all
    flag = false

    case command
      when "add"
        List.create(item: input.join(" "), status: false)

        puts "Added #{input.join(" ")} into the list"
      when "delete"
        n = input.first.to_i-1
        all_items.each_with_index do |item, count|
          if count == n
            item.delete
            flag = true
            puts "Item deleted"
          end
        end
        puts "Item #{n+1} does not exist" if flag == false
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
            p item.status
            item.toggle(:status)
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