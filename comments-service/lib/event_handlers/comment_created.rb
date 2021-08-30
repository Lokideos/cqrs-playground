module EventHandlers
  class CommentCreated
    include Import[rom: :read_rom]

    def call(event)
      data = event[:data]
      author_id = data.delete(:author_id)
      user = JSON.parse(Faraday.get("http://localhost:3001/users/#{author_id}").body, symbolize_names: true)
      data[:author_name] = user[:full_name]

      rom.relations[:comments].command(:create).call(data)
    end
  end
end
