require 'rspec/expectations'

Given /^I am logged in as organizer$/ do
  organizer = Fabricate(:organizer)
  sign_in(organizer)
  page.should have_content("Listing events")
end

private
def sign_in(user)
  visit '/'
  fill_in 'user_email', :with => user.email
  fill_in 'user_password', :with => user.password
  click_button 'Sign in'
end