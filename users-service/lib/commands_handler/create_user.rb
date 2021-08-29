module CommandsHandler
  class CreateUser
    include Import[
              user_repo: 'write_model.repositories.users',
              producer: 'kafka_producer'
            ]

    def call(payload)
      existing_user = user_repo.find_by_full_name(full_name: payload[:full_name])

      if existing_user
        existing_user
      else
        new_user = user_repo.create(payload)

        event = Events::UserCreated.new(new_user.to_h)
        producer.call(event: event, topic: 'user-topic')

        new_user
      end
    end
  end
end