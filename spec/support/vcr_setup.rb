# frozen_string_literal: true

require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = Rails.root.join('spec/vcr_cassettes')
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = false
  c.ignore_localhost = true
  c.default_cassette_options = { record: :once, allow_playback_repeats: true }
end
