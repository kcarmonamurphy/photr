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

  def login_as(user)
    visit_page
    fill_in_email(user.email)
    fill_in_password(user.password)
    submit
  end
end
