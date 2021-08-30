module CommandsHandler
  class CreateComment
    include Import[comments_repo: 'write_model.repositories.comments']

    def call(text: nil)
    end
  end
end
