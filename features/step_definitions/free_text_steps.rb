When(/^I go to the home page$/) do
  visit '/'
end

Given(/^there exists a free text question named "(.*?)"$/) do |name|
  Question.create name: name
end


Given(/^the free text question "(.*?)" has an answer "(.*?)"$/) do |question, answer|
  Question.where(name: question).first.save_answer(answer, User.first)
end