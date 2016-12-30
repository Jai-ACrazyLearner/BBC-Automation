$LOAD_PATH << File.expand_path(Dir.pwd)
Bundler.require(:default)
require 'rubygems'
require 'capybara'
require 'bundler/setup'
require_relative '../../cucumber/support/util/custom_exceptions'
require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'
require 'site_prism'
require_relative 'driver_world'
require 'rspec'

include DW::Driver

project_dir = ENV['project_dir'] ? ENV['project_dir'] : '~/'
$screenshot_dir = './test_results'

raise CucumberConfig::AppDomainNotSpecified unless ENV.has_key? 'app_host'
$APP_HOST = ENV['app_host']

################
## Cucumber hooks
################
Before do
  #capybara_setup
  raise CucumberConfig::BrowserNotSpecified if ENV['browser'].nil?
  DW::Driver.setup_browser_to_capybara(ENV['browser']) if ENV.has_key? 'browser'

  #Intialize pages
  @BBC_Radio = BBC::Pages::DeskTopPages.new
end


After do |scenario|
  if scenario.failed?
    Dir::mkdir('test_results') if not File.directory?('test_results')
    image_name = "#{scenario.name.gsub(' ', '_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    page.driver.save_screenshot($screenshot_dir,"#{image_name}")
  end
end



