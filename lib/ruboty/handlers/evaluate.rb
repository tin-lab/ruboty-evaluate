require 'open3'

module Ruboty
  module Handlers
    class Evaluate < Base
      on /eval (?<command>.+)/, name: 'evaluate', description: 'Evaluate a command'

      def evaluate(message)
        thread = Thread.start do
          stdout, stderr, _status = Open3.capture3(message[:command])
          stdout.chomp!.split("\n").each {|line| message.reply(line) } if stdout
          stderr.chomp!.split("\n").each {|line| message.reply(line) } if stderr
        end
        Thread.start do
          sleep 10
          thread.kill
        end
      end
    end
  end
end
