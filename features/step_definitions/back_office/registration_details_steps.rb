# frozen_string_literal: true

When("the registration details are shown") do
  expect(@app.registration_page.exemption_number.text).to eq(@exemption_number)
  expect(@app.registration_page.grid_ref.text).to eq(@grid_reference)
  expect(@app.registration_page.site_description.text).to eq(@site_description)
  expect(@app.registration_page.business_type.text.downcase).to eq(@business_type)

  if @business_type == "partnership"
    expect(@app.registration_page.partner_one_details).to have_content(@partner_one)
    expect(@app.registration_page.partner_one_details).to have_content(@partner_one_address)
    expect(@app.registration_page.partner_two_details).to have_content(@partner_two)
    expect(@app.registration_page.partner_two_details).to have_content(@partner_two_address)
  else
    expect(@app.registration_page.operator_name).to eq(@org_name)
    expect(@app.registration_page.operator_address).to eq(@org_address)
  end
  expect(@app.registration_page.correspondence_details.text).to have_content(@contact_name)
  expect(@app.registration_page.correspondence_details.text).to have_content(@contact_position)
  expect(@app.registration_page.correspondence_details.text).to have_content(@contact_name)
  expect(@app.registration_page.correspondence_details.text).to have_content(@contact_tel)
  expect(@app.registration_page.secondary_contact_details.text).to have_content(@alt_contact_email)
end
