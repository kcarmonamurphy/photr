# frozen_string_literal: true

require 'rails_helper'
require 'down'

describe 'file_upload' do
  let(:user) { create(:user, :full_permissions) }
  let(:root_folder) { create(:root_folder) }

  before do
    VCR.use_cassette("#{__FILE__} initial_image", :re_record_interval => 7.days) do
      @image = create(:image, folder: root_folder)
    end

    VCR.use_cassette("#{__FILE__} uploaded_image", :re_record_interval => 7.days) do
      @uploaded_image = Down.download("https://loremflickr.com/800/600/dog")
    end

    LoginPage.new.login_as(user)
  end

  context 'folder view' do
    it 'uploads a file' do
      page.attach_file('upload-photo', @uploaded_image.path, visible: false)
      expect(page).to have_content('successfully added')
    end
  end

  context 'image view' do
    before do
      click_on @image.name

      expect(page).to have_content('Change the image')
    end

    it 'uploads a file' do
      page.attach_file('upload-photo', @uploaded_image.path, visible: false)

      expect(page).to have_content('successfully added')
    end
  end
end
