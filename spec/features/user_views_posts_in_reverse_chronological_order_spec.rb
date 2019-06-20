require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario "Views posts in reverse chronological  order" do
    add_post(message: "Post number one")
    add_post(message: "This is the second post")
    expect(first(".post-text")).to have_content("This is the second post")
  end
end
