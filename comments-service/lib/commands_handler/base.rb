module CommandsHandler
  class Base
    include Import[create_comment_command: 'commands_handler.create_comment']

    def call(command)
      case command
      when Commands::CreateComment then create_comment_command.call(command.to_h)
      else
        fail 'No command'
      end
    end
  end
end