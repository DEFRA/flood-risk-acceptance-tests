# frozen_string_literal: true

# A set of helper steps, of more use when developing new features and not
# specific to any given feature or scenario.

# Use this in features where you'd like to insert a pause between steps. Useful
# if you're trying to understand what selectors to use for an element but need
# the page to be in a certain state for example
Given(/^I pause for (\d+) seconds$/) do |seconds|

  sleep(seconds.to_i)

end

# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength

def partnership_registration
  expect(@app.add_exemption_page).to have_content("Select the exemption you want to register")
  @app.add_exemption_page.submit(exemption: 13)
  @exemption_number = "FRA14"
  expect(@app.check_exemptions_page).to have_content(@exemption_number)
  expect(@app.check_exemptions_page).to have_content("Confirm your exemption")
  @app.check_exemptions_page.submit_button.click

  expect(@app.grid_reference_page).to have_content("activity")
  @grid_reference = "ST 58132 72695"
  @site_description = "Location of activity"
  @app.grid_reference_page.submit(
    grid_reference: @grid_reference,
    description: @site_description
  )
  # User type page
  @business_type = "partnership"
  @app.user_type_page.submit(org_type: @business_type)

  # Organisation name page
  @partner_one = "Partner Juan"
  @app.organisation_name_page.submit(org_name: @partner_one)

  # Postcode page
  @app.postcode_page.submit(postcode: "BS1 5AH")

  # Address page - select address from post code lookup list
  expect(page).to have_content("I cannot find the address in the list")
  @app.address_page.submit(
    result: "ENVIRONMENT AGENCY, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
  )
  @partner_one_address = "HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
  # Partnership details page
  # There is no continue button the first time through as you have to have 2
  # partners as a minimum
  @app.partnership_details_page.add_partner_link.click

  # Organisation name page
  @partner_two = "Partner Tutu"
  @app.organisation_name_page.submit(org_name: @partner_two)

  # Postcode page
  # We can just click submit because the page pre-populates the postcode lookup
  # field with the previously entered postcode
  expect(page).to have_content("BS1 5AH")
  # @app.postcode_page.submit_button.click
  @app.postcode_page.submit(postcode: "BS1 5AH")

  # Address page - select address from post code lookup list
  expect(page).to have_content("I cannot find the address in the list")
  @app.address_page.submit(
    result: "ENVIRONMENT AGENCY, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
  )
  @partner_two_address = "HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
  # Partnership details page - again!
  # The continue button should now be visible
  expect(@app.partnership_details_page).to have_content("Business partners you’ve added to this registration")
  @app.partnership_details_page.submit_button.click

  # Correspondence contact name page
  @contact_name = "Joe Bloggs"
  @contact_position = "Project Manager"
  @app.correspondence_contact_name_page.submit(
    full_name: @contact_name,
    position: @contact_position
  )

  # Correspondence contact telephone page
  @contact_tel = "01234567899"
  @app.correspondence_contact_telephone_page.submit(
    telephone_number: @contact_tel
  )

  # Correspondence contact email address page
  expect(@app.correspondence_contact_email_page).to have_content("What’s the email address")
  @contact_email = Quke::Quke.config.custom["accounts"]["SystemUser"]["username"]
  @app.correspondence_contact_email_page.submit(
    email: @contact_email,
    confirm_email: @contact_email
  )

  # Email someone else page
  expect(@app.email_someone_else_page).to have_content("confirmation email")
  @alt_contact_email = Quke::Quke.config.custom["accounts"]["SystemUser"]["username2"]
  @app.email_someone_else_page.submit(
    email: @alt_contact_email,
    confirm_email: @alt_contact_email
  )

  # Check your answers page
  expect(@app.check_your_answers_page).to have_content("Check your answers")
  @app.check_your_answers_page.submit

  expect(page).to have_content("Use of your information and privacy")
  @app.declaration_page.submit

  @registration_number = @app.confirmation_page.registration_number.text
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
