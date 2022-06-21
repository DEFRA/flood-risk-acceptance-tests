# frozen_string_literal: true

Given(/^I have signed in as "([^"]*)"$/) do |user|
  @app = App.new
  @app.login_page.load
  # Back office login page
  @app.login_page.submit(
    email: user, # this comes from your local machine
    password: ENV["FRAE_DEFAULT_PASSWORD"]
  )
  expect(@app.search_page.notification).to have_content("successfully signed in")
end
