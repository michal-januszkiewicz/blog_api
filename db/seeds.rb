# frozen_string_literal: true

require "factory_bot_rails"

ActiveRecord::Base.transaction do
  user1 = FactoryBot.create(:user)
  user2 = FactoryBot.create(:user)

  post = FactoryBot.create(:post, user: user1)
  comment_to_post = FactoryBot.create(:comment, user: user2, post: post)
  FactoryBot.create(:comment, user: user1, comment: comment_to_post)
end
