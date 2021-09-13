# frozen_string_literal: true

Given(/^I get to the check your answers page$/) do

  @app.add_exemption_page.submit(exemption: 1)

  expect(page).to have_content("FRA2")
  expect(page).to have_content("Confirm your exemption")
  @app.check_exemptions_page.submit_button.click

  expect(@app.grid_reference_page).to have_content("activity")
  @app.grid_reference_page.submit(
    grid_reference: "ST 58132 72695",
    description: "Location of activity"
  )

  # User type page
  @app.user_type_page.submit(org_type: "individual")

  # Organisation name page
  @app.organisation_name_page.submit(org_name: "Tina Turner")

  # Postcode page
  @app.postcode_page.submit(postcode: "BS1 5AH")

  # Address page - select address from post code lookup list
  expect(page).to have_content("I can’t find the address in the list")
  @app.address_page.submit(
    result: "ENVIRONMENT AGENCY, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
  )

  # Correspondence contact name page
  @app.correspondence_contact_name_page.submit(
    full_name: "Joe Bloggs",
    position: "Project Manager"
  )

  # Correspondence contact telephone page
  @app.correspondence_contact_telephone_page.submit(
    telephone_number: "01234567899"
  )

  # Correspondence contact email address page
  expect(@app.correspondence_contact_email_page).to have_content("What’s the email address")
  @app.correspondence_contact_email_page.submit(
    email: Quke::Quke.config.custom["accounts"]["SystemUser"]["username"],
    confirm_email: Quke::Quke.config.custom["accounts"]["SystemUser"]["username"]
  )

  # Email someone else page
  expect(@app.email_someone_else_page).to have_content("confirmation email")
  @app.email_someone_else_page.submit(
    email: Quke::Quke.config.custom["accounts"]["SystemUser"]["username2"],
    confirm_email: Quke::Quke.config.custom["accounts"]["SystemUser"]["username2"]
  )

  expect(@app.check_your_answers_page.current_url).to end_with "/steps/check_your_answers"
end

And(/^The user wishes to correct their address$/) do

  @app.check_your_answers_page.back_link.click
  @app.email_someone_else_page.back_link.click
  @app.correspondence_contact_email_page.back_link.click
  @app.correspondence_contact_telephone_page.back_link.click
  @app.correspondence_contact_name_page.back_link.click

  expect(@app.address_page.current_url).to end_with "_address"

end

When(/^I enter the address manually and complete the registration$/) do

  @app.address_page.cannot_find_address_link.click

  # Address page - enter manual details
  @app.address_page.submit(
    address_premises: "environment agency",
    street_address: "horizon house",
    address_locality: "deanery road",
    address_city: "bristol"
  )

  @app.correspondence_contact_name_page.submit_button.click
  @app.correspondence_contact_telephone_page.submit_button.click
  expect(@app.correspondence_contact_email_page).to have_content("What’s the email address")
  @app.correspondence_contact_email_page.submit_button.click
  expect(@app.email_someone_else_page).to have_content("confirmation email")
  @app.email_someone_else_page.submit_button.click
  expect(@app.check_your_answers_page).to have_content("Check your answers")
  @app.check_your_answers_page.submit

  @app.declaration_page.submit

  @registration_number = @app.confirmation_page.registration_number.text

  expect(@registration_number).to start_with "EXFRA"

end

Then(/^I should see just one result when searching for the registration$/) do

  # search page
  @app.search_page.nav_bar.home_link.click
  @app.search_page.submit(search_value: @registration_number)
  expect(@app.search_page.search_results_status.size).to eq(1)

end
