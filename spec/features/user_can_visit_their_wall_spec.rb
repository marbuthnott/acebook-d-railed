# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "User's wall", type: :feature do
  scenario 'user redirected to their own wall after login or signup' do
    sign_up(
      username: 'test',
      email: 'test@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
    user = User.all[0]

    expect(page).to have_current_path("/users/#{user.id}/posts")
  end

  scenario 'user will see a 404 page if user wall doesn\'t exist' do
    sign_up(
      username: 'test',
      email: 'test@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
    visit '/users/1/posts'
    expect(page).to have_content('The meerkat you were looking for is no longer in the burrow.')
  end
end
