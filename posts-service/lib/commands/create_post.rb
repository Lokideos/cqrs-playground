module Commands
  class CreatePost
    include Import[post_repo: 'write_model.repositories.posts']

    def call(text: nil)
    end
  end
end
