module CommandsHandler
  class CreateUser
    include Import[user_repo: 'write_model.repositories.users',]

    def call(payload)
      existing_user = user_repo.find_by_full_name(full_name: payload[:full_name])

      if existing_user
        existing_user
      else
        user_repo.create(payload)
      end
    end
  end
end