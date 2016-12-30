

Given(/^I can see the radio nav$/) do
  @BBC_Radio.home_page.load
  expect(@BBC_Radio.home_page.title.to_s === "BBC - iPlayer radio")
  are_urls_equal_for_page_instance?(@BBC_Radio.home_page)
  expect(@BBC_Radio.home_page).to have_stations_categories_schedules_section
  expect(@BBC_Radio.home_page.stations_categories_schedules_section).to have_stations
  expect(@BBC_Radio.home_page.stations_categories_schedules_section).to have_categories
  expect(@BBC_Radio.home_page.stations_categories_schedules_section).to have_schedules
end

Given(/^I navigated to all stations page$/) do
  @BBC_Radio.all_stations_page.load
end