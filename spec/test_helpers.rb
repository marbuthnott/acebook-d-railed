def go_to_homepage
  visit '/'
end

def sign_up(name: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')
  go_to_homepage
  fill_in('user[name]', with: name)
  fill_in('user[email]', with: email)
  fill_in('user[password]', with: password)
  fill_in('user[password_confirmation]', with: password)
  click_button('Signup')
end