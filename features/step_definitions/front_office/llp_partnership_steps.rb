Given(/^I am a limited liability partnership$/) do
  # User type page
  @app.user_type_page.submit(org_type: "limited_liability_partnership")

  # Limited company number page
  @app.registration_number_page.submit(llp_reg_number: "12345678")

  # Organisation name page
  @app.organisation_name_page.submit(llp_name: "LLP R US")

  # Postcode page
  @app.postcode_page.submit(llp_postcode: "BS1 5AH")

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

  # Check your answers page
  @app.check_your_answers_page.submit_button.click
end
