# frozen_string_literal: true

module Api
  module V1
    class ApiController < ApplicationController
      before_action :authenticate_request!

      private

      # TODO: add authentication

      def current_user; end

      def authenticate_request!; end
    end
  end
end
