# rubocop:disable Metrics/BlockLength
Given(/^I am a partnership$/) do
  # User type page
  @app.user_type_page.submit(org_type: 'partnership')

  # Organisation name page
  @app.organisation_name_page.submit(partnership_full_name: 'Mickey Mouse')

  # Postcode page
  @app.postcode_page.submit(partnership_postcode: 'BS1 5AH')

  # Address page - select address from post code lookup list
  @app.address_page.submit(
    result: 'ENVIRONMENT AGENCY, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH'
  )

  # Partnership details page
  # There is no continue button the first time through as you have to have 2
  # partners as a minimum
  @app.partnership_details_page.add_partner_link.click

  # Organisation name page
  @app.organisation_name_page.submit(partnership_full_name: 'Mickey Mouse')

  # Postcode page
  # We can just click submit because the page pre-populates the postcode lookup
  # field with the previously entered postcode
  @app.postcode_page.submit_button.click

  # Address page - select address from post code lookup list
  @app.address_page.submit(
    result: 'ENVIRONMENT AGENCY, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH'
  )

  # Partnership details page - again!
  # The continue button should now be visible
  @app.partnership_details_page.submit_button.click

  # Correspondence contact name page
  @app.correspondence_contact_name_page.submit(
    full_name: 'Joe Bloggs',
    position: 'Project Manager'
  )

  # Correspondence contact telephone page
  @app.correspondence_contact_telephone_page.submit(
    telephone_number: '01234567899'
  )

  # Correspondence contact email address page
  @app.correspondence_contact_email_page.submit(
    email: 'tim.stone.ea@gmail.com',
    confirm_email: 'tim.stone.ea@gmail.com'
  )

  # Email someone else page
  @app.email_someone_else_page.submit(
    email: 'tim.stone.ea+1@gmail.com',
    confirm_email: 'tim.stone.ea+1@gmail.com'
  )

  # Check your answers page
  @app.check_your_answers_page.submit_button.click
end
# rubocop:enable Metrics/BlockLength
