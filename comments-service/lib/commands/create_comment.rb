module Commands
  class CreateComment
    include Import[post_repo: 'write_model.repositories.comments']

    def call(text: nil)
    end
  end
end
