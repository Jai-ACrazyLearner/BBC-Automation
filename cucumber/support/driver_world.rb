require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'capybara-screenshot/cucumber'
require 'selenium-webdriver'
require 'capybara'


module DW
  module Driver
    Capybara.configure do |config|
      config.app_host = $APP_HOST
      config.default_selector = :css
      config.default_max_wait_time = 30
      config.ignore_hidden_elements = false
      Capybara::Screenshot.autosave_on_failure = true
    end

    def self.setup_browser_to_capybara(config)
      case config
        when "phantom"
          phantomjs_debug = false
          ignore_ssl_errors = true
          ssl_protocol = 'any'
          Capybara.javascript_driver = :poltergeist
          Capybara.default_driver = :poltergeist
          Capybara.register_driver :poltergeist do |app|
            Capybara::Poltergeist::Driver.new(
                app,
                :js_errors => false,
                :inspector => false,
                :debug => phantomjs_debug,
                :phantomjs_options => [
                    '--ignore-ssl-errors=' << (ignore_ssl_errors ? 'yes' : 'no'),
                    '--ssl-protocol=' << ssl_protocol
                ]
            )
          end
        when "firefox"
          Capybara.default_driver = :firefox
          Capybara.javascript_driver = :selenium
          Capybara.register_driver :firefox do |app|
            Capybara::Selenium::Driver.new(
                app,
                :browser => :firefox,
                :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.firefox(marionette: false)
            )
          end
        when "chrome"
          #Need To make chrome driver executable by running => "sudo chmod +x cucumber/support/driver/chromedriver"
          Capybara.default_driver = :chrome
          Capybara.javascript_driver = :selenium
          Capybara.register_driver :chrome do |app|
            Capybara::Selenium::Driver.new(
                app,
                :browser => :chrome,
                :driver_path => './cucumber/support/driver/chromedriver'
            )
          end
      end
      session = Capybara.current_session
      session.visit $APP_HOST
    end

    # def initialize(screenshot_path)
    #   @screenshot_path = screenshot_path
    #   Capybara.app_host = $APP_HOST
    #   Capybara.default_max_wait_time = 10
    #   Capybara.ignore_hidden_elements = false
    #   Capybara::Screenshot.autosave_on_failure = false
    #   Capybara.save_and_open_page_path = @screenshot_path
    # end

    private
    def register_screenshot_for_driver(web_driver)
      Capybara::Screenshot.register_driver(web_driver) do |driver, path|
        driver.browser.save_screenshot(path)
      end

    end
  end
end










