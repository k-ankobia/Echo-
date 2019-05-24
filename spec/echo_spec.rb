require 'echo'

describe Echo do
subject(:echo) {described_class.new}
  describe '#prompt' do 
    it ' prompts a user to say something' do 
      expect {echo.prompt}.to output("Say something:").to_stdout
    end
  end

  describe '#answer' do 
    it 'outputs the answer from user input' do
      allow(STDIN).to receive(:gets).and_return('Hello World')
      expect(echo.answer).to eq('Hello World')
    end

    it ' outputs the phrase and time entered' do 
      time = Time.new(2018, 01, 9, 16, 26, 2, "+00:00")
      allow(Time).to receive(:now).and_return(time)
    allow(STDIN).to receive(:gets).and_return('Hello, World')

    expect { echo.say_something }.to output( "2018-01-09 | 16:26 | You said: 'Hello, World'!").to_stdout

    end
  end
end
