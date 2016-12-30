module BBC
  module Pages
    # Desktop pages for BBC
    class DeskTopPages

      def common_elements
        CommonElementsAcrossPages.new
      end

      def home_page
        Radio.new
      end

      def all_categories_page
        AllCategories.new
      end

      def all_stations_page
        RadioSations.new
      end

    end
  end


  module MobilePages
    # mobile pages Examples for BBC
    class MobilePage
    end
  end
end


