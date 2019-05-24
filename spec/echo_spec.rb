require 'echo'

describe Echo do
subject(:echo) {described_class.new}
  describe '#prompt' do 
    it ' prompts a user to say something' do 
      expect {echo.prompt}.to output("Say something:").to_stdout
    end
  end

  describe '#say_something' do 
    it 'allows a user to enter phrase to say something' do
      allow(STDIN).to receive(:gets).and_return('Hello World')
      expect(echo.say_something('Hello World')).to eq('Hello World')
    end
  end
end