# frozen_string_literal: true

module ExceptionsHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
  end

  private

  def not_found(exception)
    render status: :not_found, json: { errors: exception.message }
  end
end
