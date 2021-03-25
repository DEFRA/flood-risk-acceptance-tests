# frozen_string_literal: true

Given(/^I am an individual$/) do
  # User type page
  @app.user_type_page.submit(org_type: "individual")

  # Organisation name page
  @app.organisation_name_page.submit(individual_name: "Tina Turner")

  # Postcode page
  @app.postcode_page.submit(individual_postcode: "BS1 5AH")

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

  # Check your answers page
  expect(@app.check_your_answers_page).to have_content("Check your answers")
  @app.check_your_answers_page.submit
end
