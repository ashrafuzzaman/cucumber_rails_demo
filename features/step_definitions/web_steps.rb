require 'rspec/expectations'

When /^I fill in "(.*?)" with "(.*?)"$/ do |name, value|
  fill_in name, :with => value
end

When /^I check "(.*?)"$/ do |element|
  check element
end

When /^I press "(.*?)"$/ do |button_text|
  click_button button_text
end

Then /^I should see "(.*?)"$/ do |value|
  page.should have_content(value)
end