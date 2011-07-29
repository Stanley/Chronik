Given /^label "([^"]*)"$/ do |label|
  @label = Chronik::Label.new label
end

When /^we are interested only in holidays between (\d+\.\d+\.\d+) and (\d+\.\d+\.\d+)$/ do |from, to|
  @range = (Date.parse(from)..Date.parse(to))
end

Then /^the holidays should be "([^"]*)"$/ do |val|
  @label.holidays(@range).should eql(val.split(',').map{|day| Date.parse day})
end

Then /^the weekdays should be "([^"]*)"$/ do |val|
  @label.weekdays.should eql(val.split(',').map{|wday| wday.to_i})
end
