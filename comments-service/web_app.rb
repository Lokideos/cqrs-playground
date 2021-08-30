require "hanami/api"

class WebApp < Hanami::API
  get "/" do
    App.keys.join(' ')
  end

  get "/comments" do
    json(App['queries.list'].call.map(&:to_h))
  end

  get "/comments/:id" do
    json(App['queries.show'].call(id: params[:id]).to_h)
  end

  post "/comments" do
    command = Commands::CreateComment.new.call(text: params.dig(:comment, :text))
    result = App['commands_handler.base'].call(command)

    json(result.to_h)
  end
end
