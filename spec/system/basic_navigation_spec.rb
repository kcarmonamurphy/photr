# frozen_string_literal: true

require 'rails_helper'

describe 'basic navigation' do
  let(:user) { create(:user, :full_permissions) }
  let(:root_folder) { create(:root_folder) }

  before do
    VCR.use_cassette("#{__FILE__} images", :re_record_interval => 7.days) do
      @photos = create_list(:image, 4, folder: root_folder)
    end

    LoginPage.new.login_as(user)
  end

  it 'should show four images' do
    @photos.each do |photo|
      expect(page).to have_content(photo.name)
    end
  end
end
