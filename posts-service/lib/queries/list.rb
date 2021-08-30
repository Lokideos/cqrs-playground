module Queries
  class List
    include Import[posts_repo: 'read_model.repositories.posts']

    def call
      posts_repo.all
    end
  end
end
