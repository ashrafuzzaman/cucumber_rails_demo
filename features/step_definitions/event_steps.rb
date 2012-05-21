require 'rspec/expectations'

Given /^the following events:$/ do |events|
  Event.create!(events.hashes)
end

Given /^I am on the new event page$/ do
  visit new_event_path
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |value|
  fill_in :name, :with => value
end

When /^I fill in "start date" with "(.*?)"$/ do |value|
  enter_date(:event_start_date, value)
end

When /^I fill in "end date" with "(.*?)"$/ do |value|
  enter_date(:event_end_date, value)
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
def enter_date(id, date)
	year, month, day = date.split('-')
	select year, :with => "#{id}_1i"
	select month, :with => "#{id}_2i"
	select day, :with => "#{id}_3i"
end