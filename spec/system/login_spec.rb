# frozen_string_literal: true

require 'rails_helper'

describe 'login', type: :system do
  let(:user) { create(:user, email: 'admin@example.com') }

  before do
    @login_page = LoginPage.new

    create(:root_folder)
  end

  it 'successfully logs in as user' do
    @login_page.visit_page

    @login_page.fill_in_email(user.email)
    @login_page.fill_in_password(user.password)
    @login_page.submit

    expect(page).to_not have_content('Something went wrong')
    expect(page).to have_content('Logout')
    expect(page).to have_current_path('/path')
  end

  it 'fails to login because of wrong password' do
    @login_page.visit_page

    @login_page.fill_in_email(user.email)
    @login_page.fill_in_password('lalalala')
    @login_page.submit

    expect(page).to have_content('Login')
    expect(page).to have_content('Invalid email or password')
  end

  it 'fails to login because of wrong email' do
    @login_page.visit_page

    @login_page.fill_in_email('sdfalkj@lksdf.ca')
    @login_page.fill_in_password(user.password)
    @login_page.submit

    expect(page).to have_content('Login')
    expect(page).to have_content('Invalid email or password')
  end

  it 'fails to login because both fields are blank' do
    @login_page.visit_page
    @login_page.submit

    expect(page).to have_content('Login')
    expect(page).to have_content('Invalid email or password')
  end
end
