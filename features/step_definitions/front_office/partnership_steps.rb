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

And(/^add 3 partners$/) do
  # The previous step is assumed to be 'I select exemption FRA#' which does not
  # click the submit button, hence its the first action we have to take here.
  @app.check_exemptions_page.submit_button.click

  # Grid reference page
  @app.grid_reference_page.submit(
    grid_reference: 'ST 58132 72695',
    description: 'Location of activity'
  )

  # User type page
  @app.user_type_page.submit(org_type: 'partnership')

  # 1ST PARTNER
  # Organisation name page
  @app.organisation_name_page.submit(partnership_full_name: 'Mickey Mouse')

  # Postcode page
  @app.postcode_page.submit(partnership_postcode: 'BS1 5AH')

  # Address page - select address from post code lookup list
  @app.address_page.submit(
    result: 'ENVIRONMENT AGENCY, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH'
  )

  # 2ND PARTNER
  # Partnership details page
  # There is no continue button the first time through as you have to have 2
  # partners as a minimum
  @app.partnership_details_page.add_partner_link.click

  # Organisation name page
  @app.organisation_name_page.submit(partnership_full_name: 'Minnie Mouse')

  # Postcode page
  # We can just click submit because the page pre-populates the postcode lookup
  # field with the previously entered postcode
  @app.postcode_page.submit_button.click

  # Address page - select address from post code lookup list
  @app.address_page.submit(
    result: 'ENVIRONMENT AGENCY, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH'
  )

  # 3RD PARTNER
  # Partnership details page - again!
  # There is no continue button the first time through as you have to have 2
  # partners as a minimum
  @app.partnership_details_page.add_partner_link.click

  # Organisation name page
  @app.organisation_name_page.submit(partnership_full_name: 'Daffy Duck')

  # Postcode page
  # We can just click submit because the page pre-populates the postcode lookup
  # field with the previously entered postcode
  @app.postcode_page.submit_button.click

  # Address page - select address from post code lookup list
  @app.address_page.submit(
    result: 'ENVIRONMENT AGENCY, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH'
  )
end

Given(/^then remove one$/) do
  # Capybara now has built in support for accepting dialog boxes (without
  # needing to extra driver specific code or explicit waits). Simply wrap the
  # code which causes the dialog with page.accept_confirm. In essence you are
  # passing the code which causes the dialog to appear as a block to the method.
  # http://www.rubydoc.info/github/jnicklas/capybara/Capybara%2FSession%3Aaccept_confirm
  # http://stackoverflow.com/a/26348968/6117745
  page.accept_confirm do
    @app.partnership_details_page.remove_links.last.click
  end
end

Then(/^I will just see the remaining 2 partners$/) do
  expect(@app.partnership_details_page.remove_links.length).to eq(2)
end
