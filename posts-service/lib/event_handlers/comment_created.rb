module EventHandlers
  class CommentCreated
    include Import[rom: :read_rom]

    def call(event)
      data = event[:data]
      author_id = data.delete(:author_id)
      user = rom.relations[:users].by_pk(author_id).one
      data[:author_name] = user&.full_name || 'Anon'

      rom.relations[:comments].command(:create).call(data)

      post = rom.relations[:posts].by_pk(data[:post_id]).one
      if post
        rom.relations[:posts].command(:update).call(comments_count: post.comments_count + 1)
      end
    end
  end
end
