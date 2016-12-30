##
# All the common sections will be shared to page objects
module BBCRadio
  module Sections
    #radio nav section
    class Radionav < SitePrism::Section
      element :stations, '.radionav__stations-link'
      element :categories, '.radionav__categories-link'
      element :schedules, '.radionav__schedules-link'
    end
  end
end