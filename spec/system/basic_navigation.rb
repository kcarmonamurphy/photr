# frozen_string_literal: true

require 'rails_helper'

describe 'basic navigation', type: :system do
  let(:user) { create(:user, :full_permissions, email: 'admin@example.com') }

  before do
    LoginPage.new.login_as(user)

    root_folder = create(:root_folder)
    @photos = create_list(:image, 4, folder: root_folder)
  end

  it 'should show four images' do
    @photos.each do |photo|
      expect(page).to have_content(photo.name)
    end
  end
end
