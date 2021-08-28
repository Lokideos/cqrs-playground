module Commands
  class CreateUser
    include Import[user_repo: 'write_model.repositories.users']

    def call(_payload)
    end
  end
end