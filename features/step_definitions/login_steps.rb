require 'rspec/expectations'

Given /^I am logged in$/ do
  user = Fabricate(:user)
  sign_in(user)
  page.should have_content("Welcome, #{user.name}")
end

private
def sign_in(user)
  visit '/'
  fill_in 'user_email', :with => user.email
  fill_in 'user_password', :with => user.password
  click_button 'sign me in'
end