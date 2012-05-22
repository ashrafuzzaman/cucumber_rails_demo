require 'rspec/expectations'

Given /^the following events:$/ do |events|
  Event.create!(events.hashes)
end

Given /^I am on the new event page$/ do
  visit new_event_path
end

When /^I fill in "Start at" with "(.*?) (.*?), (.*?) (.*?):(.*?)"$/ do |day, month, year, hour, minute|
  enter_date(:event_start_at, day, month, year, hour, minute)
end

When /^I fill in "End at" with "(.*?) (.*?), (.*?) (.*?):(.*?)"$/ do |day, month, year, hour, minute|
  enter_date(:event_end_at, day, month, year, hour, minute)
end

Then /^Event should be created$/ do
  page.should have_content('Event was successfully created.')
end

When /^I delete the (\d+)(?:st|nd|rd|th) event$/ do |pos|
  visit events_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following events:$/ do |expected_events_table|
  expected_events_table.diff!(find('table').all('tr').map { |row| row.all('th:not(.action), td:not(.action)').map { |cell| cell.text.strip } })
end

private
def enter_date(id, day, month, year, hour, minute)
  #puts "year, month, day #{year}, #{month}, #{day}"
	select year, :from => "#{id}_1i"
	select month, :from => "#{id}_2i"
	select day, :from => "#{id}_3i"
  select hour, :from => "#{id}_4i"
  select minute, :from => "#{id}_5i"
end