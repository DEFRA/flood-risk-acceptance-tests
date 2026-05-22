# frozen_string_literal: true

# Fix Quke's use of deprecated headless! method for Firefox in newer Selenium.
unless Selenium::WebDriver::Firefox::Options.method_defined?(:headless!)
  Selenium::WebDriver::Firefox::Options.define_method(:headless!) do
    add_argument("-headless")
  end
end

# Configure Firefox to render JSON responses as raw text in a <pre> tag
# (like Chrome does), instead of using Firefox's built-in JSON viewer.
# This ensures page objects that parse JSON via element(:json_data, "pre")
# work consistently across browsers.
original_firefox_profile = Quke::DriverConfiguration.instance_method(:firefox_profile)
Quke::DriverConfiguration.define_method(:firefox_profile) do
  profile = original_firefox_profile.bind(self).call
  profile["devtools.jsonview.enabled"] = false
  profile
end
