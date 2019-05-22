# frozen_string_literal: true

module Posts
  module UseCases
    class Show
      def self.call(id:)
        new(id).call
      end

      def initialize(id)
        @id = id
      end

      def call
        Repository.post_with_comments_and_users(id: id)
                  .then { |post| Representers.with_comments_and_users(post) }
      end

      private

      attr_reader :id
    end
  end
end
