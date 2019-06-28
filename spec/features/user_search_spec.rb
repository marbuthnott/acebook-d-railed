
require 'rails_helper'

RSpec.feature 'Posts', type: :feature do

  scenario "Search results that match a username will redirect to that users wall" do
    sign_up(
      username: 'test1',
      email: 'test1@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
    click_link('Sign out')
    sign_up(
      username: 'test2',
      email: 'test2@test.com',
      password: 'password',
      password_confirmation: 'password'
    )

    fill_in "user_search", with: "test1"
    click_button "Go"
    expect(page).to have_content("test1")
  end

  scenario "Search results that don't match a username will reload the current wall" do
    sign_up(
      username: 'test1',
      email: 'test1@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
    click_link('Sign out')
    sign_up(
      username: 'test2',
      email: 'test2@test.com',
      password: 'password',
      password_confirmation: 'password'
    )

    fill_in "user_search", with: "wrong username"
    click_button "Go"
    expect(page).to have_content("test2")
  end

  scenario "A logged in user can see a search box" do
    sign_up(
      username: 'test1',
      email: 'test1@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
    expect(page).to have_field("user_search")
  end
end