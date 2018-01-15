Given(/^I am a charity$/) do
  # User type page
  @app.user_type_page.submit(org_type: "other")

  # Organisation name page
  @app.organisation_name_page.submit(other_name: "Boy scouts")

  # Postcode page
  @app.postcode_page.submit(other_postcode: "BS1 5AH")

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
