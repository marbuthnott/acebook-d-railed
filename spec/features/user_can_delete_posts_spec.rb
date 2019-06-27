# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Posts', type: :feature do

  scenario 'Users are able to delete their own posts' do
    sign_up(
      username: 'test',
      email: 'test@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
    add_post(message: 'Post number one')
    add_post(message: 'This is the second post')

    first(:button, 'Delete').click

    expect(page).to have_content('Post number one')
    expect(page).not_to have_content('This is the second post')
  end

  scenario 'Users cannot delete posts that are not their own' do
    sign_up(
      username: 'test1',
      email: 'test1@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
    click_link 'Sign out'

    sign_up(
      username: 'test2',
      email: 'test2@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
    click_link('Members')
    click_link('test1')
    add_post(message: 'Post to be deleted')
    click_link 'Sign out'

    sign_in(email: 'test1@test.com', password: 'password')
    click_button('Delete')

    expect(page).to have_content('Post to be deleted')
    expect(page).to have_content(
      'Post can only be deleted or edited by its author!'
    )
  end
end
