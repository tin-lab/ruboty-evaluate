module Ruboty
  module Handlers
    class Evaluate < Base
      on /eval (?<command>.+)/, name: 'evaluate', description: 'Evaluate a command'

      def evaluate(message)
        thread = Thread.start do
          result = `#{message[:command]}`.chomp!
          message.reply(result)
        end
        Thread.start do
          sleep 10
          thread.kill
        end
      end
    end
  end
end
