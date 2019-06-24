# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  scenario 'Can display date with post text' do
    sign_up(email: 'test@test.com', password: 'password')
    add_post(message: 'Hello, world!')

    time = Post.all[0].updated_at.strftime('%Y-%m-%d, %H:%M')

    expect(page).to have_content('Hello, world!')
    expect(page).to have_content(time)
  end
end
