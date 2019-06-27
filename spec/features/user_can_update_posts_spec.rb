# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  scenario 'user can update posts' do
    sign_up(username: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')
    add_post(message: 'Post number one')

    first(:button, 'Edit').click

    expect(page).to have_content('Post number one')

    post = Post.all[0]
    updated_time = post.updated_at.strftime('%Y-%m-%d, %H:%M')

    fill_in('Message', with: 'This is an edited message!')
    click_button 'Update'

    expect(page).to have_content('This is an edited message!')
    expect(page).not_to have_content('Post number one')
    expect(page).to have_content(updated_time)
  end

  scenario 'Users cannot update posts that are not their own' do
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
    add_post(message: 'Post to be updated')
    click_link 'Sign out'

    sign_in(email: 'test1@test.com', password: 'password')
    click_button('Edit')

    expect(page).to have_content('Post to be updated')
    expect(page).to have_content(
      'Post can only be deleted or edited by its author!'
    )

  scenario 'flash message if edit button clicked after 10 minutes' do
    sign_up(username: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')
    add_post(message: 'Post number one')
    Timecop.freeze(Time.now + 11.minutes)
    post = Post.all[0]
    user = User.all[0]

    first(:button, 'Edit').click

    expect(page).to have_content('Post can only be edited 10 min after it has been created')
    expect(page).to have_current_path("/users/#{user.id}/posts")
    Timecop.return
  end
end
