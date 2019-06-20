def go_to_homepage
  visit "/"
end

def sign_up(email: "test@test.com", password: "password")
  go_to_homepage
  fill_in("user[email]", with: email)
  fill_in("user[password]", with: password)
  click_button("Signup")
end

def add_post(message: "Post number one")
  visit "/posts/new"
  fill_in "Message", with: message
  click_button "Submit"
end
