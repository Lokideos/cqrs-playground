module Queries
  class List
    include Import[comments_repo: 'read_model.repositories.comments']

    def call
      comments_repo.all
    end
  end
end
