require 'openai'

class NoteSummarizer
  def initialize
    @openai = OpenAI::Client.new
  end

  def generate_summary(title, body)
    prompt = "Title: #{title}\nBody: #{body}\n\nSummarize the note:"
    response = @openai.completions(
      parameters:{
      model: 'text-davinci-003',
      prompt: prompt,
      max_tokens: 100,
      temperature: 0.3}
    )
    puts "responsees from openai"
    puts response
    summary = response['choices'][0]['text'].strip

    return summary
  end
end
