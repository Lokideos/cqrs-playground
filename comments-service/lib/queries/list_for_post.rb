module Queries
  class ListForPost
    include Import[comments_repo: 'read_model.repositories.comments']

    def call(post_id: nil)
      comments_repo.all_for_post(post_id: post_id)
    end
  end
end
