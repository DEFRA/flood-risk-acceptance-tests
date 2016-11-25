# rubocop:disable Metrics/BlockLength
Given(/^I am a local authority$/) do
  # User type page
  @app.user_type_page.submit(org_type: 'local_authority')

  # Organisation name page
  @app.organisation_name_page.submit(local_authority_name: 'Testminster council')

  # Postcode page
  @app.postcode_page.submit(local_authority_postcode: 'BS1 5AH')

  # Address page - select address from post code lookup list
  @app.address_page.submit(
    result: 'ENVIRONMENT AGENCY, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH'
  )

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
  expect(page).to have_content 'Footbridge over a main river not more than 8 metres wide from bank to bank'
  expect(page).to have_content 'tim.stone.ea@gmail.com'
  expect(page).to have_content 'Joe Bloggs'
  expect(page).to have_content 'ST 58132 72695'
  expect(page).to have_content 'Testminster council'
  expect(page).to have_content 'HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH'
  expect(page).to have_content 'Local authority or public body'
  @app.check_your_answers_page.submit_button.click

end
# rubocop:enable Metrics/BlockLength
