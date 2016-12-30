
When(/^I select "([^"]*)" in the radio nav$/) do |category|
  category = category.downcase
  click_on_sections = "@BBC_Radio.home_page.stations_categories_schedules_section.#{category}.click"
  instance_eval(click_on_sections)
  sleep 2
end

When(/^I select "([^"]*)" in the radio nav again$/) do |category|
  step "I select \"#{category}\" in the radio nav"
end

When(/^I select the all categories link$/) do
  @BBC_Radio.home_page.links_in_categories.all_categories.click
end


When(/^I select Local Radio in the stations drawer/) do
  @BBC_Radio.home_page.links_in_stations.local_radio.click
end

When(/^I am on the all stations page$/) do
  are_urls_equal_for_page_instance?(@BBC_Radio.all_stations_page)
end


When(/^I click on the iPlayer Radio logo$/) do
  @BBC_Radio.common_elements.iplayer_radio_logo.click
end

When(/^I select "([^"]*)" in the stations drawer$/) do |network|
@BBC_Radio.home_page.within(@BBC_Radio.home_page.stations) {find_link "#{network}"}.click
end