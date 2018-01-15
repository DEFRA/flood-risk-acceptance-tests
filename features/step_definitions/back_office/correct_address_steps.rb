Given(/^I get to the check your answers page$/) do
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
    result: "NATURAL ENGLAND, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
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
  @app.correspondence_contact_email_page.submit_button.click
  @app.email_someone_else_page.submit_button.click
  @app.check_your_answers_page.submit_button.click

  @app.declaration_page.declaration_button.click

  @exemption_number = @app.confirmation_page.exemption_number.text

  expect(@exemption_number).to start_with "EXFRA"

end

Then(/^I should see just one result when searching for the registration$/) do

  # search page
  @app.search_page.nav_bar.home_link.click
  @app.search_page.search_field.set @exemption_number
  @app.search_page.search_button.click

  expect(@app.search_page.search_results_view_btns.size).to eq(1)

end
