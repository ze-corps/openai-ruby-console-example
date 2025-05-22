require './storyteller'
require 'dotenv/load'

puts 'Prompts to display the story based on: '
prompts = gets.chomp

story = Storyteller.new(prompts)
new_story = story.tell
puts new_story
