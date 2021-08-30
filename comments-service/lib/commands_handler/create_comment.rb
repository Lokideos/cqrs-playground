module CommandsHandler
  class CreateComment
    include Import[
              comments_repo: 'write_model.repositories.comments',
              producer: 'kafka_producer'
            ]

    def call(payload)
      return {} if payload[:body] == ''

      new_comment = comments_repo.create(payload)

      event = Events::CommentCreated.new(new_comment.to_h)
      producer.call(event: event, topic: 'comment-topic')

      new_comment
    end
  end
end
