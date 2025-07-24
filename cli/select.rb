require "tty-prompt"
class Select
  attr_reader :choices
  def initialize(choices)
    @choices = choices
  end 

  def call
    prompt = TTY::Prompt.new
    prompt.select("Choose a backup file:",choices)
  end 
end 
