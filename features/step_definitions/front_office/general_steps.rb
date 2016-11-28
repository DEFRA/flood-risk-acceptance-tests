Given(/^I am an external user$/) do

  @app = App.new
  @app.front_office_home_page.load

end

Given(/^I register exemption FRA(\d+)$/) do |code|

  @app.add_exemption_page.submit(exemption: "FRA#{code}")

  expect(page).to have_content("FRA#{code}")
  @app.check_exemptions_page.submit_button.click

  @app.grid_reference_page.submit(
    grid_reference: 'ST 58132 72695',
    description: 'Location of activity'
  )

end

Given(/^I select exemption FRA(\d+)$/) do |code|

  @app.add_exemption_page.submit(exemption: "FRA#{code}")

  expect(page).to have_content("FRA#{code}")

end

When(/^I select exemption FRA(\d+) as a "([^"]*)"$/) do |code, org_type|

  # Add exemption page
  @app.add_exemption_page.submit(exemption: "FRA#{code}")

  # Check exemptions page
  expect(page).to have_content("FRA#{code}")
  @app.check_exemptions_page.submit_button.click

  # Grid reference page
  @app.grid_reference_page.submit(
    grid_reference: 'ST 58132 72695',
    description: 'Location of activity'
  )

  # User type page
  @app.user_type_page.submit(org_type: org_type)

end

Then(/^I will be asked to give the approximate length of dredging planned$/) do

  # The previous step is assumed to be 'I select exemption FRA#' which does not
  # click the submit button, hence its the first action we have to take here.
  @app.check_exemptions_page.submit_button.click

  expect(@app.grid_reference_page.dredging_length).not_to be_nil

end

# rubocop:disable Lint/HandleExceptions
Then(/^I will NOT be asked to give the approximate length of dredging planned$/) do

  # The previous step is assumed to be 'I select exemption FRA#' which does not
  # click the submit button, hence its the first action we have to take here.
  @app.check_exemptions_page.submit_button.click

  begin
    expect(@app.grid_reference_page.dredging_length).to raise_error Capybara::ElementNotFound
  rescue StandardError
    # We do nothing with the error. We just don't want it to bubble up as
    # a failure.
  end

end
# rubocop:enable Lint/HandleExceptions

Given(/^I then opt to change FRA(\d+)$/) do |code|

  # We can get away with just selecting the first link because currently you can
  # only select one exemption so there will only ever be one link
  @app.check_exemptions_page.remove_links.first.click

  expect(@app.add_exemption_page.exemption_checked?("FRA#{code}")).to be false

end

Then(/^I will be taken back to the add exemptions page$/) do
  expect(page).to have_content 'Select the exemption you want to register'
end

When(/^I confirm my registration$/) do
  @app.declaration_page.declaration_button.click
end

Then(/^I will see confirmation my registration has been submitted$/) do
  expect(page).to have_content 'Registration submitted '
end

And(/^give "([^"]*)" as the contact$/) do |name|

  # Correspondence contact name page
  @app.correspondence_contact_name_page.submit(
    full_name: name,
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
  @app.email_someone_else_page.submit_button.click

end
