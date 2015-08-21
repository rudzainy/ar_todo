require_relative 'config/application'
require_relative 'lib/util'
require_relative 'app/controllers/controller'
require_relative 'app/view/display'

# puts "Put your application code in #{File.expand_path(__FILE__)}"

# Keywords
# add : List#add_item
# delete : List#delete_item
# edit : List#edit_item
# toggle : Item#toggle
# list : Display#display_list


display = Display.new
terminal = Controller.new

input = ARGV

clear_screen!
move_to_home!

terminal.process_input(input, display)
display.interface
