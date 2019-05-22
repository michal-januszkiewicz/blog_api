# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true
  belongs_to :comment, optional: true
  has_many :comments, dependent: :destroy

  def parent
    @parent ||= post || comment
  end
end
