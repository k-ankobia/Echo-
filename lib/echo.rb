# frozen_string_literal: true

class Echo
  def say_something
    answer
    time = Time.now.strftime('%Y-%m-%d | %H:%M |')
    print "#{time} You said: '#{@answer}'!"
  end

  def prompt
    print 'Say something:'
  end

  def answer
  @answer = STDIN.gets
  end
end
