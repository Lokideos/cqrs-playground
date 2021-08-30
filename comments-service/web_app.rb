require "hanami/api"

class WebApp < Hanami::API
  get "/" do
    App.keys.join(' ')
  end

  get "/comments" do
    json(App['queries.list'].call.map(&:to_h))
  end

  get "/posts/:post_id/comments" do
    json(App['queries.list_for_post'].call(post_id: params[:post_id]).map(&:to_h))
  end

  post "/comments" do
    command = Commands::CreateComment.new.call(text: params.dig(:comment, :text))
    result = App['commands_handler.base'].call(command)

    json(result.to_h)
  end
end
