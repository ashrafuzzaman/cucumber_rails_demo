require 'rspec/expectations'

Given /^the following events:$/ do |events|
  Event.create!(events.hashes)
end

Given /^I am on the new event page$/ do
  visit new_event_path
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |name, value|
  fill_in name, :with => value
end

When /^I fill in "Start at" with "(.*?)-(.*?)-(.*?)"$/ do |year, month, day|
  enter_date(:event_start_at, year, month, day)
end

When /^I fill in "End at" with "(.*?)-(.*?)-(.*?)"$/ do |year, month, day|
  enter_date(:event_end_at, year, month, day)
end

When /^I press "(.*?)"$/ do |button_text|
  click_button button_text
end

Then /^Event should be created$/ do
  page.should have_content('Event was successfully created.')
end

Then /^I should see "(.*?)"$/ do |value|
  page.should have_content(value)
end

private
def enter_date(id, year, month, day)
	select year, :with => "#{id}_1i"
	select month, :with => "#{id}_2i"
	select day, :with => "#{id}_3i"
end