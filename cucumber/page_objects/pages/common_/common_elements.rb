require "site_prism"

=begin
 This class holds
  all the elements commonly shared for the different pages
=end

class CommonElementsAcrossPages < SitePrism::Page
  element :search_field, '#orb-search-q'
  element :iplayer_radio_logo, '.iplayer-radio__logo-link'


  def is_search_field_exist?
  end

  def i_player_radio_logo_exist?
  end

end