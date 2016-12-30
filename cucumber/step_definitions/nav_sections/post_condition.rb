Then(/^the "([^"]*)" drawer is open$/) do |category|
  category = category.downcase
  case category
    when "stations"
      @BBC_Radio.home_page.wait_until_stations_list_visible
    when "categories"
      @BBC_Radio.home_page.wait_until_categories_list_visible
    when "schedules"
      @BBC_Radio.home_page.wait_until_schedules_list_visible
  end
end


Then(/^the "([^"]*)" drawer is closed$/) do |category|
  category = category.downcase
  case category
    when "stations"
      @BBC_Radio.home_page.wait_until_stations_list_invisible
    when "categories"
      @BBC_Radio.home_page.wait_until_categories_list_invisible
    when "schedules"
      @BBC_Radio.home_page.wait_until_schedules_list_invisible
  end
end


Then(/^the "([^"]*)" drawer is open and the other drawers are closed$/) do |category|

  step "the \"#{category}\" drawer is open"

  case category
    when "stations"
      @BBC_Radio.home_page.wait_until_schedules_list_invisible && @BBC_Radio.home_page.wait_until_categories_list_invisible
    when "categories"
      @BBC_Radio.home_page.wait_until_schedules_list_invisible && @BBC_Radio.home_page.wait_until_stations_list_invisible
    when "schedules"
      @BBC_Radio.home_page.wait_until_categories_list_invisible && @BBC_Radio.home_page.wait_until_stations_list_invisible
      @BBC_Radio.home_page.section_name.root_element.css("height")
  end
end


Then(/^I can see the following categories$/) do |categories|
  data_should_have_on_the_categories_list = categories.raw
  data_should_have_on_the_categories_list.each do |rowdata|
    rowdata.each do |categories|
      expect(@BBC_Radio.home_page.find_all_the_link_text_on_categories_list).to include categories
    end
  end
end


Then(/^I can see the following stations/) do |stations|
  data_should_have_on_the_stations_list = stations.raw
  data_should_have_on_the_stations_list.each do |rowdata|
    rowdata.each do |stations|
      expect(@BBC_Radio.home_page.find_all_the_link_text_on_stations_list).to include stations
    end
  end
end


Then(/^I can see the following local networks$/) do |local_networks|
  data_should_have_on_the_categories_list = local_networks.raw
  data_should_have_on_the_categories_list.each do |rowdata|
    rowdata.each do |local_stations|
      expect(@BBC_Radio.all_stations_page.find_all_the_link_text_on_local_radio_list).to include local_stations
    end
  end
end

Then(/^I can see the radio stations with following links$/) do |network_link_table|
  table_hash = network_link_table.hashes
  table_hash.each do |element|
    expect(@BBC_Radio.home_page.find_all_the_link_text_on_stations_list).to include element['stations']
    expect(@BBC_Radio.home_page.find_all_the_link_text_on_stations_list_links).to include element['links']
  end
end

Then(/^I should be on the radio homepage$/) do
  are_urls_equal_for_page_instance?(@BBC_Radio.home_page)
end

  Then(/^I am on the following "([^"]*)"$/) do |link|
  expected_url = link
  actual_url = Capybara.current_url
  raise " Expected URL => #{page_link} not matched to current URL => #{actual_url} page_link" unless expected_url == actual_url
end
