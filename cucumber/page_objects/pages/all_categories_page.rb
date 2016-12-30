require_relative '../../page_objects/pages/common_/section'

=begin
 This class represents
 http://www.bbc.co.uk/radio/programmes/genres page
 all the elements of the page & methods will be exposed to site_prism as page_object
=end

class AllCategories < SitePrism::Page
  set_url '/radio/programmes/genres'
  set_url_matcher '/radio/programmes/genres'
  section :stations_categories_schedules_section, BBCRadio::Sections::Radionav, '.radionav__wrap'
end

