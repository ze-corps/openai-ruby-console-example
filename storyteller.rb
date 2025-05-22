# frozen_string_literal: true

require './config/initializers/config'

# connects with OpenAI and shares story
class Storyteller
  def initialize(notes)
    @notes = notes
  end

  def tell
    client = OpenAI::Client.new
    prompt = "Tell us a 5 line story based on follow notes: #{@notes}"
    response = client.chat(
      parameters: {
        model: 'gpt-4',
        messages: [{ role: 'user', content: prompt }],
        temperature: 0.7
      }
    )
    response.dig('choices', 0, 'message', 'content')
  end
end
