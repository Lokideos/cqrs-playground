module Queries
  class Show
    include Import[posts_repo: 'read_model.repositories.posts']

    def call(id: nil)
      posts_repo.find_with_comments(id)
    end
  end
end
