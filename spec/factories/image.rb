# frozen_string_literal: true

require 'down'

FactoryBot.define do
  factory :image do
    transient do
      keyword { 'dog' }
    end

    sequence(:name) { |n| "Image #{n} of #{keyword}" }

    before(:create) do |image, evaluator|
      tempfile = Down.download("https://loremflickr.com/800/500/#{evaluator.keyword}")
      image.file.attach(io: tempfile, filename: tempfile.original_filename)
    end
  end
end
