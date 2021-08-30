require "hanami/api"

class WebApp < Hanami::API
  get "/" do
    App.keys.join(' ')
  end

  get "/posts" do
    json(App['queries.list'].call.map(&:to_h))
  end

  get "/posts/:id" do
    json(App['queries.show'].call(id: params[:id]).to_h)
  end

  post "/posts" do
    command = Commands::CreatePost.new(params[:post])
    result = App['commands_handler.base'].call(command)

    json(result.to_h)
  end
end
