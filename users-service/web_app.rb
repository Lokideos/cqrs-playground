require "hanami/api"

class WebApp < Hanami::API
  get "/" do
    App.keys.join(' ')
  end

  get "/users" do
    json(App['queries.list'].call.map(&:to_h))
  end

  get "/users/:id" do
    json(App['queries.show'].call(id: params[:id]).to_h)
  end

  post "/users" do
    command = Commands::CreateUser.new(full_name: params.dig(:user, :full_name))
    result = App['commands_handler.base'].call(command)

    json(result.to_h)
  end
end
