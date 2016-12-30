require "site_prism"
require_relative "../../support/util/helpers"
require_relative '../../page_objects/pages/common_/section'

=begin
 This class represents
 http://www.bbc.co.uk/radio/stations page
 all the elements of the page & methods will be exposed to site_prism as page_object
=end

class RadioSations < SitePrism::Page

  set_url '/radio/stations'
  set_url_matcher '/radio/stations'

  elements :all_stations_nations_national_list, '.nations-and-national-logo-list ul'
  elements :local_radio_list, '#local li'

  section :stations_categories_schedules_section, BBCRadio::Sections::Radionav, '.radionav__wrap'

  # Returns Capybara::Node::Element tag="li" for local_radio_list
  def find_all_the_link_text_on_local_radio_list
    local_radio_list.map { |local_radio_station| local_radio_station.text }
  end

end






