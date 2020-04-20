require 'support/page'

class LoginPage < Page

  def visit_page
    visit 'login'
  end

  def fill_in_email(email)
    fill_in 'Email', with: email 
  end

  def fill_in_password(password)
    fill_in 'Password', with: password
  end

  def submit
    click_on "Login"
  end
end
