And(/^complete the remaining steps as an individual$/) do

  # Organisation name page
  @app.organisation_name_page.submit(individual_name: 'Napoleon Solo')

  # Postcode page
  @app.postcode_page.submit(individual_postcode: 'BS1 5AH')

  # Address page - select address from post code lookup list
  @app.address_page.submit(
    result: 'ENVIRONMENT AGENCY, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH'
  )

  # Correspondence contact name page
  @app.correspondence_contact_name_page.submit(
    full_name: 'Napoleon Solo',
    position: 'Owner'
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
  @app.email_someone_else_page.submit_button.click

end

Then(/^I will see all the details I entered as an individual$/) do

  # Check your answers page
  expect(page).to have_content 'Electrical cable service crossing over a main river'
  expect(page).to have_content 'ST 58132 72695'
  expect(page).to have_content 'Location of activity'
  expect(page).to have_content 'Individual'
  expect(page).to have_content 'Napoleon Solo'
  expect(page).to have_content 'HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH'
  expect(page).to have_content 'Napoleon Solo (Owner)'
  expect(page).to have_content '01234567899'
  expect(page).to have_content 'tim.stone.ea@gmail.com'

end

Then(/^I will see all the details I entered as a partnership$/) do

  # Check your answers page
  expect(page).to have_content 'Electrical cable service crossing over a main river'
  expect(page).to have_content 'ST 58132 72695'
  expect(page).to have_content 'Location of activity'
  expect(page).to have_content 'Partnership'
  expect(page).to have_content 'Steve Rogers, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH'
  expect(page).to have_content 'Bruce Banner, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH'
  expect(page).to have_content 'Tony Stark, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH'
  expect(page).to have_content 'Nick Fury (Project Manager)'
  expect(page).to have_content '01234567899'
  expect(page).to have_content 'tim.stone.ea@gmail.com'

end
