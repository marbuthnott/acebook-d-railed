require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario "Can display date with post text" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    time = Post.all[0].updated_at.strftime("%Y-%m-%d, %H:%M")
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content(time)
  end
end
