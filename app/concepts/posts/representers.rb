# frozen_string_literal: true

module Posts
  class Representers
    class << self
      def with_comments_and_users(post)
        {
          id: post.id,
          author: post.user.name,
          title: post.title,
          content: post.content,
          comments: represent_comments(post.comments),
        }
      end

      private

      def represent_comments(comments)
        comments.map do |comment|
          {
            id: comment.id,
            author: comment.user.name,
            content: comment.content,
            comments: represent_comments(comment.comments),
            parent_id: comment.parent.id,
            parent_type: comment.parent.class.to_s,
          }
        end
      end
    end
  end
end
