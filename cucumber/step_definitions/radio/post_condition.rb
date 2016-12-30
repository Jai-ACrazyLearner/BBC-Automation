Then(/^I am on the all categories page$/) do
  expect(@BBC_Radio.all_categories_page.title.to_s == "BBC radio - Genres")
  are_urls_equal_for_page_instance?(@BBC_Radio.all_categories_page)
  expect(@BBC_Radio.all_categories_page).to have_stations_categories_schedules_section
  expect(@BBC_Radio.all_categories_page.stations_categories_schedules_section).to have_stations
  expect(@BBC_Radio.all_categories_page.stations_categories_schedules_section).to have_categories
  expect(@BBC_Radio.all_categories_page.stations_categories_schedules_section).to have_schedules
end