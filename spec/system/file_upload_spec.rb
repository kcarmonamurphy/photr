# frozen_string_literal: true

require 'rails_helper'

describe 'file_upload' do
  let(:user) { create(:user, :full_permissions) }
  let(:root_folder) { create(:root_folder) }

  before do
    @image = create(:image, folder: root_folder)

    LoginPage.new.login_as(user)
  end

  context 'image view' do
    before do
      click_on @image.name

      expect(page).to have_content('Change the image')
    end

    it 'uploads a file' do
      page.attach_file('upload-photo', file_fixture('mug.jpg'), visible: false)

      expect(page).to have_content('successfully added')
    end
  end

  context 'folder view' do
    it 'uploads a file' do
      page.attach_file('upload-photo', file_fixture('cute-kitten.jpg'), visible: false)

      expect(page).to have_content('successfully added')
    end
  end
end
