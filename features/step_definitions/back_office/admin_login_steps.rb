# frozen_string_literal: true

Given(/^I have signed in as "([^"]*)"$/) do |user|
  @app = App.new
  @app.login_page.load
  # Back office login page
  @app.login_page.submit(
    email: user, # this comes from your local machine
    password: ENV["FRAE_DEFAULT_PASSWORD"]
  )

  # If we don't check for some form of confirmation that we have logged in,
  # though the scenario will fail it will report the proceeding step as the
  # culprit, rather than the login
  expect(@app.search_page).to have_alert_success

end
