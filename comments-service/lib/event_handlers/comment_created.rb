module EventHandlers
  class CommentCreated
    include Import[comments_repo: 'write_model.repositories.comments']

    def call
    end
  end
end
