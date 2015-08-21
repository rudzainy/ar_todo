require_relative 'config/application'
require_relative 'lib/util'

puts "Put your application code in #{File.expand_path(__FILE__)}"

# Keywords
# add : List#add_item
# delete : List#delete_item
# edit : List#edit_item
# toggle : Item#toggle
# list : Display#display_list

session = Database.new
# screen = Display.new
# terminal = Controller.new
# list = List.new(database.memory)
input = ARGV

clear_screen!
move_to_home!

Controller.process_input(input)
Display.interface
# session.write(list)