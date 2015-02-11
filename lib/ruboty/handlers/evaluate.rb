module Ruboty
  module Handlers
    class Evaluate < Base
      on /eval (?<command>.+)/, name: 'evaluate', description: 'Evaluate a command'

      def evaluate(message)
        thread = Thread.start do
          stdout, stderr, status = Open3.capture3(message[:command])
          message.reply(stdout.chomp) if stdout
          message.reply(stderr.chomp) if stderr

          unless status.success?
            message.reply("Command Failed:\n#{message[:command]}", code: true)
          end
        end
        Thread.start do
          sleep 10
          thread.kill
        end
      end
    end
  end
end
