module Queries
  class List
    include Import[user_repo: 'read_model.repositories.users']

    def call
    end
  end
end