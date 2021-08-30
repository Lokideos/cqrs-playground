module CommandsHandler
  class CreatePost
    include Import[
              posts_repo: 'write_model.repositories.posts',
              producer: 'kafka_producer'
            ]

    def call(payload)
      return {} if payload[:body] == ''

      new_post = posts_repo.create(payload)

      event = Events::PostCreated.new(new_post.to_h)
      producer.call(event: event, topic: 'post-topic')

      new_post
    end
  end
end
