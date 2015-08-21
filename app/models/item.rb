require_relative '../../db/config'

class Item
  attr_accessor :text, :done

  def initialize(done = false, text)
    @text = text
    @done = done
  end

  def toggle
    if (@done == false)
      @done = true
    else
     @done = false
    end
  end
end