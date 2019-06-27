# frozen_string_literal: true

def go_to_homepage
  visit '/'
end

def sign_up(
  username: 'test',
  email: 'test@test.com',
  password: 'password',
  password_confirmation: 'password'
)
  go_to_homepage
  fill_in('user[username]', with: username)
  fill_in('user[email]', with: email)
  fill_in('user[password]', with: password)
  fill_in('user[password_confirmation]', with: password_confirmation)
  click_button('SIGN UP')
end

def sign_in(email: 'test@test.com', password: 'password')
  click_link('Sign in')
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  click_button('SIGN IN')
end

def sign_in_and_add_post(message:, email: 'test@test.com', password: 'password')
  click_link('Sign in')
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  click_button('SIGN IN')
  click_link('New post')
  fill_in('Message', with: message)
  click_button('Submit')
end

def add_post(message:)
  click_link 'New post'
  fill_in('Message', with: message)
  click_button('Submit')
end
