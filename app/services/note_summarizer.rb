require 'openai'

class NoteSummarizer
  def initialize
    @openai = OpenAI::Client.new
  end

  def generate_summary(title, body)
    prompt = "Title: #{title}\nBody: #{body}\n\nSummarize the note:"
    response = @openai.completions(
      parameters: {
        model: 'text-davinci-003',
        prompt: prompt,
        max_tokens: 100,
        temperature: 0.3
      }
    )

    puts "Response from OpenAI:"
    puts response

    if response['error'] && response['error']['type'] == 'insufficient_quota'
      puts "You exceeded your current quota. Please purchase a GPT-3 API subscription."
    else
      # summary = response['choices'][0]['text'].strip
      summary= "needed api subscription"
    end

    

    return summary
  end
end
