module CommandsHandler
  class Base
    include Import[create_post_command: 'commands_handler.create_post']

    def call(command)
      case command
      when Commands::CreatePost then create_post_command.call(command.to_h)
      else
        fail 'No command'
      end
    end
  end
end