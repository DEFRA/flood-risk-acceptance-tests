Given(/^I have a valid username and password$/) do

  # Back office login page
  @app.login_page.submit(
    email: 'alan.cruikshanks@environment-agency.gov.uk',
    password: 'Abcde12345'
  )

end

Given(/^I have an invalid username and password$/) do

  # Back office login page
  @app.login_page.submit(
    email: 'mister.tumble@example.co.uk',
    password: 'Abcde12345'
  )

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
