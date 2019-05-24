require 'echo'

describe Echo do
subject(:echo) {described_class.new}
  describe '#prompt' do 
    it ' prompts a user to say something' do 
      expect {echo.prompt}.to output("Say something:").to_stdout
    end
  end

end