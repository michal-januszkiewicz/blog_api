# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.paragraph }
    post { nil }
    comment { nil }
    user
  end
end
