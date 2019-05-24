# frozen_string_literal: true

require 'echo'

describe Echo do
  subject(:echo) { described_class.new }
  describe '#prompt' do
    it ' prompts a user to say something' do
      expect { echo.prompt }.to output('Say something: ').to_stdout
    end
  end

  describe '#answer' do
    it 'outputs the answer from user input' do
      allow(STDIN).to receive(:gets).and_return('Hello World')
      expect(echo.answer).to eq('Hello World')
    end

    it ' outputs the phrase and time entered' do
      time = Time.new(2018, 0o1, 9, 16, 26, 2, '+00:00')
      allow(Time).to receive(:now).and_return(time)
      allow(STDIN).to receive(:gets).and_return('Hello, World')
      echo.answer
      expect { echo.say_something }.to output("2018-01-09 | 16:26 | You said: 'Hello, World'!\n").to_stdout
    end

    describe '#engine' do 
      it ' continues to prompt user for input until exit' do
        time = Time.new(2018, 01, 9, 16, 26, 2, '+00:00')
        allow(Time).to receive(:now).and_return(time)
        allow(STDIN).to receive(:gets).and_return('Hello, World')

        allow(echo).to receive(:loop).and_yield
        expect { echo.engine }.to output("Say something: 2018-01-09 | 16:26 | You said: 'Hello, World'!\n").to_stdout
      end
    end
  end
end
