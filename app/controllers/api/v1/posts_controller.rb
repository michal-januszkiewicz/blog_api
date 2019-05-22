# frozen_string_literal: true

module Api
  module V1
    class PostsController < ApiController
      def show
        post = Posts::UseCases::Show.call(show_params)
        render json: post
      end

      private

      def show_params
        params
          .permit(:id)
          .to_h
          .symbolize_keys
      end
    end
  end
end
