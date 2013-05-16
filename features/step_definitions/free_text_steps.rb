When(/^I go to the home page$/) do
  visit '/'
end

Given(/^there exists a free text question named "(.*?)"$/) do |name|
  Question.create name: name
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content text
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, text|
  fill_in field, :with => text
end

When(/^I click the button "(.*?)"$/) do |text|
  click_button text
end