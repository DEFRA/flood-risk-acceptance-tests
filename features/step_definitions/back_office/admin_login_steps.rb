Given(/^I have a valid username and password$/) do
  # Back office login page
  @app.login_page.submit(
    email: Quke::Quke.config.custom["accounts"]["SystemUser"]["username"],
    password: Quke::Quke.config.custom["accounts"]["SystemUser"]["password"]
  )

  # If we don't check for some form of confirmation that we have logged in,
  # though the scenario will fail it will report the proceeding step as the
  # culprit, rather than the login
  expect(@app.search_page).to have_alert_success

end

Given(/^I have an invalid username and password$/) do

  # Back office login page
  @app.login_page.submit(
    email: "mister.tumble@example.co.uk",
    password: ENV["FRAE_DEFAULT_PASSWORD"]
  )

  expect(@app.login_page).to have_alert_invalid

end

Then(/^I will be able to login$/) do

  # We could just do a `expect(page).to have_content()`` but doing the following
  # also checks the alert element appears
  expect(@app.search_page).to have_alert_success

end

Then(/^I will NOT be able to login$/) do

  # We could just do a `expect(page).to have_content()`` but doing the following
  # also checks the alert element appears
  expect(@app.login_page).to have_alert_invalid

end
