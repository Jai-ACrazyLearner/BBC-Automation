require 'colorize'

def validate_class_exist_and_visible?(instance, selector)
  expect(instance).to have_selector("#{selector}", visible: true)
end

def validate_class_exist_and_not_visible?(instance, selector)
  byebug
  expect(instance).to have_no_selector("#{selector}", visible: false)
end

def url_for_page(page_instance)
  Capybara.app_host
end

def are_urls_equal_for_page_instance?(bbc_current_instance)

  bbc_current_instance_expected_url = bbc_current_instance.current_url
  site_prism_url_matcher = bbc_current_instance.url_matcher
  site_prism_instance_url = bbc_current_instance.current_host + site_prism_url_matcher

  expected_url = URI(bbc_current_instance_expected_url)
  site_prism_url_matcher = URI(site_prism_instance_url)

  raise "Current URL => #{bbc_current_instance_expected_url} not matched with Expected URL => #{site_prism_url_matcher}" unless expected_url.scheme === site_prism_url_matcher.scheme and expected_url.host === site_prism_url_matcher.host and expected_url.path === site_prism_url_matcher.path
end

