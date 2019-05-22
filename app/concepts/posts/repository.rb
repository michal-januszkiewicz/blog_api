# frozen_string_literal: true

module Posts
  class Repository
    class << self
      def post_with_comments_and_users(id:)
        Post
          .includes(:user, comments: [:user, comments: :user])
          .find(id)
      end
    end
  end
end
