# frozen_string_literal: true

And(/^complete the remaining steps as an individual$/) do

  # Organisation name page
  @app.organisation_name_page.submit(individual_name: "Napoleon Solo")

  # Postcode page
  @app.postcode_page.submit(individual_postcode: "S60 1BY")

  # Address page - select address from post code lookup list
  @app.address_page.submit(
    result: "ENVIRONMENT AGENCY, BOW BRIDGE CLOSE, ROTHERHAM, S60 1BY"
  )

  # Correspondence contact name page
  @app.correspondence_contact_name_page.submit(
    full_name: "Napoleon Solo",
    position: "Owner"
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
  @app.email_someone_else_page.submit_button.click

end

Then(/^I will see all the details I entered as an individual$/) do

  # Check your answers page
  expect(page).to have_content "Electrical cable service crossing over a main river"
  expect(page).to have_content "ST 58132 72695"
  expect(page).to have_content "Location of activity"
  expect(page).to have_content "Individual"
  expect(page).to have_content "Napoleon Solo"
  expect(page).to have_content "BOW BRIDGE CLOSE, ROTHERHAM, S60 1BY"
  expect(page).to have_content "Napoleon Solo (Owner)"
  expect(page).to have_content "01234567899"
  # email address removed as this currently changes by environment

end

Then(/^I will see all the details I entered as a partnership$/) do

  # Check your answers page
  expect(page).to have_content "Electrical cable service crossing over a main river"
  expect(page).to have_content "ST 58132 72695"
  expect(page).to have_content "Location of activity"
  expect(page).to have_content "Partnership"
  expect(page).to have_content "Steve Rogers, GHYLL MOUNT, GILLAN WAY, PENRITH 40 BUSINESS PARK, PENRITH, CA11 9BP"
  expect(page).to have_content "Bruce Banner, GHYLL MOUNT, GILLAN WAY, PENRITH 40 BUSINESS PARK, PENRITH, CA11 9BP"
  expect(page).to have_content "Tony Stark, GHYLL MOUNT, GILLAN WAY, PENRITH 40 BUSINESS PARK, PENRITH, CA11 9BP"
  expect(page).to have_content "Nick Fury (Project Manager)"
  expect(page).to have_content "01234567899"
  # email address removed as this currently changes by environment

end
