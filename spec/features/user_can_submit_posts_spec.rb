# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  scenario 'Can submit posts and view them' do
    sign_up(username: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')
    add_post(message: 'Hello, world!')

    expect(page).to have_content('Hello, world!')
  end

  scenario 'Can\'t add an empty post' do
    sign_up(username: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')
    add_post(message: '')

    expect(page).to have_content('Message can\'t be blank')
  end
end
