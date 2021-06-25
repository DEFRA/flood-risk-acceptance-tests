# frozen_string_literal: true

Given(/^I am an individual$/) do
  # User type page
  expect(page).to have_content("individual")
  check_for_accessibility
  @app.user_type_page.submit(org_type: "individual")

  # Organisation name page
  expect(page).to have_content("name?")
  check_for_accessibility
  @app.organisation_name_page.submit(org_name: "Tina Turner")

  # Postcode page
  expect(page).to have_content("address")
  check_for_accessibility
  @app.postcode_page.submit(postcode: "BS1 5AH")

  # Address page - select address from post code lookup list
  expect(page).to have_content("I can’t find the address in the list")
  check_for_accessibility
  @app.address_page.submit(
    result: "ENVIRONMENT AGENCY, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
  )

  # Correspondence contact name page
  expect(page).to have_content("contact")
  check_for_accessibility
  @app.correspondence_contact_name_page.submit(
    full_name: "Joe Bloggs",
    position: "Project Manager"
  )

  # Correspondence contact telephone page
  expect(page).to have_content("telephone number")
  check_for_accessibility
  @app.correspondence_contact_telephone_page.submit(
    telephone_number: "01234567899"
  )

  # Correspondence contact email address page
  expect(@app.correspondence_contact_email_page).to have_content("What’s the email address")
  check_for_accessibility
  @app.correspondence_contact_email_page.submit(
    email: Quke::Quke.config.custom["accounts"]["SystemUser"]["username"],
    confirm_email: Quke::Quke.config.custom["accounts"]["SystemUser"]["username"]
  )

  # Email someone else page
  expect(@app.email_someone_else_page).to have_content("confirmation email")
  check_for_accessibility
  @app.email_someone_else_page.submit(
    email: Quke::Quke.config.custom["accounts"]["SystemUser"]["username2"],
    confirm_email: Quke::Quke.config.custom["accounts"]["SystemUser"]["username2"]
  )

  # Check your answers page
  expect(@app.check_your_answers_page).to have_content("Check your answers")
  check_for_accessibility
  @app.check_your_answers_page.submit
end
