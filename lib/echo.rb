# frozen_string_literal: true

class Echo
  def say_something
    time = Time.now.strftime('%Y-%m-%d | %H:%M |')
    print "#{time} You said: '#{@answer}'!\n"
  end

  def prompt
    print "Say something: "
  end

  def answer
    @answer = STDIN.gets.chomp
  end

  def engine
    loop do
      prompt
      answer
      if @answer == 'exit'
        print 'Goodbye'
        break
      else
        say_something
      end
    end
  end
end
