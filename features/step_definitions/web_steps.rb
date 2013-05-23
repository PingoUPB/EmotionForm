Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content text
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, text|
  fill_in field, :with => text
end

When(/^I click the button "(.*?)"$/) do |text|
  click_button text
end

When(/^I follow "(.*?)"$/) do |text|
  click_link text # express the regexp above with the code you wish you had
end