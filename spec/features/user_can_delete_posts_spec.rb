require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  scenario 'Users are able to delete thier own posts' do
    sign_up(name: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')
    visit '/posts/new'
    fill_in 'Message', with: 'Post number one'
    click_button 'Submit'

    visit '/posts/new'
    fill_in 'Message', with: 'This is the second post'
    click_button 'Submit'

    first(:button, 'Delete').click
    expect(page).to have_content('Post number one')
    expect(page).not_to have_content('This is the second post')
  end
end