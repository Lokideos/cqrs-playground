module EventHandlers
  class PostCreated
    include Import[rom: :read_rom]

    def call(event)
      data = event[:data]
      author_id = data.delete(:author_id)
      user = rom.relations[:users].by_pk(author_id).one
      data[:author_name] = user&.full_name || 'Anon'

      rom.relations[:posts].command(:create).call(data)
    end
  end
end
