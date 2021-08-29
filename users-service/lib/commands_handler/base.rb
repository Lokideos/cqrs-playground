module CommandsHandler
  class Base
    include Import[create_user_command: 'commands_handler.create_user']

    def call(command)
      case command
      when Commands::CreateUser then create_user_command.call(command.to_h)
      else
        fail 'No command'
      end
      # App["commands_handler:#{command.command_name}"].call(command.to_h)
    end
  end
end