require "site_prism"
require_relative "../../support/util/helpers"
require_relative '../../page_objects/pages/common_/section'

=begin
 This class represents
 http://www.bbc.co.uk/radio page
 all the elements of the page & methods will be exposed to site_prism as page_object
=end

class Radio < SitePrism::Page

  set_url '/radio'
  set_url_matcher '/radio'

  element :stations, '#stations-panel .radionav-drawer__stations-list'
  elements :categories_list, '#categories-panel .radionav-drawer__categories-list li'
  elements :stations_list, '#stations-panel .radionav-drawer__stations-list li'
  elements :stations_list_links, '#stations-panel .radionav-drawer__stations-list li a'
  elements :schedules_list, '#schedules-panel .radionav-drawer__stations-list li'

  section :stations_categories_schedules_section, BBCRadio::Sections::Radionav, '.radionav__wrap'

  section :links_in_categories, '#categories-panel' do
    element :all_categories, '.radionav-category--all-categories .radionav-category__all-link'
  end

  section :links_in_stations, '#stations-panel' do
    element :local_radio, '.radionav-drawer__stations-list .stations--localradio'
  end

  # Returns Capybara::Node::Element tag="li" for categories_list
  def find_all_the_link_text_on_categories_list
      categories_list.map { |categories_list| categories_list.text }
  end

  # Returns Capybara::Node::Element tag="li" for stations_list
  def find_all_the_link_text_on_stations_list
    stations_list.map { |station_list| station_list.text }
  end

  # Returns Capybara::Node::Element tag="a" for stations_list
  def find_all_the_link_text_on_stations_list_links
    stations_list_links.map { |station_list_link| station_list_link['href'] }
  end

end






