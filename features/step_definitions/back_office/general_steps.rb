When(/^I register a flood risk activity exemption for a customer$/) do

  @app.search_page.nav_bar.registrations_menu.click
  @app.search_page.nav_bar.new_option.click

  @app.add_exemption_page.submit(
    exemption: "FRA2"
  )

  expect(page).to have_content("FRA2")
  @app.check_exemptions_page.submit_button.click

  @app.grid_reference_page.submit(
    grid_reference: "ST 58132 72695",
    description: "Location of activity"
  )

  # User type page
  @app.user_type_page.submit(org_type: "individual")

  # Organisation name page
  @app.organisation_name_page.submit(individual_name: "Tina Turner")

  # Postcode page
  @app.postcode_page.submit(individual_postcode: "BS1 5AH")

  # Address page - select address from post code lookup list
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
  @app.correspondence_contact_email_page.submit(
    email: "tim.stone.ea@gmail.com",
    confirm_email: "tim.stone.ea@gmail.com"
  )

  # Email someone else page
  @app.email_someone_else_page.submit(
    email: "tim.stone.ea+1@gmail.com",
    confirm_email: "tim.stone.ea+1@gmail.com"
  )

  # Check your answers page
  @app.check_your_answers_page.submit_button.click

  @app.declaration_page.declaration_button.click

  @exemption_number = @app.confirmation_page.exemption_number.text
  puts @exemption_number
end

Then(/^I will see confirmation the registration has been submitted$/) do
  expect(page).to have_content "Registration submitted"
end

Then(/^I will see the registration is "([^"]*)"$/) do |action|
  expect(@app.registration_details_page.registration_status.text).to eq(action)
end
