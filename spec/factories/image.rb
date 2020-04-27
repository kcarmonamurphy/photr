# frozen_string_literal: true

require 'down'

FactoryBot.define do
  factory :image do
    # sequence(:name) { |n| "Image #{n}" }

    before(:create) do |image|
      tempfile = Down.download('https://loremflickr.com/800/500/dog')

      image.name = tempfile.original_filename
      image.file.attach(io: File.open(tempfile.path), filename: tempfile.original_filename)
    end
  end
end
