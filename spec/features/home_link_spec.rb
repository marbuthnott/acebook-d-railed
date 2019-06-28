# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Home button', type: :feature do
  scenario 'Signup page has no home link' do
    go_to_homepage

    expect(page).not_to have_link('Home')
  end

  scenario 'Signin page has no home link' do
    go_to_homepage
    click_link('Sign in')

    expect(page).not_to have_link('Home')
  end

  scenario 'User can navigate back to their wall from other walls' do
    sign_up(
      username: 'test',
      email: 'test@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
    click_link('Members')
    click_link('Home')

    expect(page).to have_content('test\'s Wall.')
  end
end
