module EventHandlers
  class PostCreated
    include Import[post_repo: 'write_model.repositories.posts']

    def call
    end
  end
end
