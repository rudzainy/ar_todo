# Clear the screen
def clear_screen!
  print "\e[2J"
end

# Moves cursor to the top left of the terminal
def move_to_home!
  print "\e[H"
end