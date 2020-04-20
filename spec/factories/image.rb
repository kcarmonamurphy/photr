# frozen_string_literal: true

FactoryBot.define do
  factory :image do
    sequence(:name) { |n| "Image #{n}" }
  end
end
