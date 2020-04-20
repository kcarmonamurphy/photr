# frozen_string_literal: true

FactoryBot.define do
  factory :folder do
    sequence(:name) { |n| "Folder #{n}" }

    factory :root_folder do
      name { "root_folder" }
      parent { nil }
    end
  end
end
