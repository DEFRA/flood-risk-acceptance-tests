# frozen_string_literal: true

Given("I start a registration") do
  @app = App.new
  @app.front_office_home_page.load
  @app.front_office_home_page.accept_cookies
end

Given(/^I register exemption FRA(\d+)$/) do |code|
  expect(@app.add_exemption_page).to have_content("Select the exemption you want to register")
  check_for_accessibility
  @app.add_exemption_page.submit(exemption: (code - 1))

  expect(@app.check_exemptions_page).to have_content("FRA#{code}")
  expect(@app.check_exemptions_page).to have_content("Confirm your exemption")
  check_for_accessibility
  @app.check_exemptions_page.submit_button.click

  expect(@app.grid_reference_page).to have_content("activity")
  check_for_accessibility
  @app.grid_reference_page.submit(
    grid_reference: "ST 58132 72695",
    description: "Location of activity"
  )
end

Given(/^I select exemption FRA(\d+)$/) do |code|
  @app.add_exemption_page.submit(exemption: (code - 1))

  expect(page).to have_content("FRA#{code}")

end

When(/^I select exemption FRA(\d+) as a "([^"]*)"$/) do |code, org_type|

  # Add exemption page
  expect(page).to have_content("Select the exemption you want to register")
  @app.add_exemption_page.submit(exemption: (code - 1))

  # Check exemptions page
  expect(page).to have_content("FRA#{code}")
  expect(page).to have_content("Confirm your exemption")

  @app.check_exemptions_page.submit_button.click

  # Grid reference page
  expect(@app.grid_reference_page).to have_content("National Grid reference")
  @app.grid_reference_page.submit(
    grid_reference: "ST 58132 72695",
    description: "Location of activity"
  )

  # User type page
  @app.user_type_page.submit(org_type: org_type)

end

Then(/^I will be asked to give the approximate length of dredging planned$/) do

  # The previous step is assumed to be 'I select exemption FRA#' which does not
  # click the submit button, hence its the first action we have to take here.
  expect(page).to have_content("Confirm your exemption")
  @app.check_exemptions_page.submit_button.click

  expect(@app.grid_reference_page.dredging_length).not_to be_nil

end

Then(/^I will NOT be asked to give the approximate length of dredging planned$/) do

  # The previous step is assumed to be 'I select exemption FRA#' which does not
  # click the submit button, hence its the first action we have to take here.
  expect(page).to have_content("Confirm your exemption")
  @app.check_exemptions_page.submit_button.click

  begin
    expect(@app.grid_reference_page.dredging_length).to raise_error Capybara::ElementNotFound
  rescue StandardError
    # We do nothing with the error. We just don't want it to bubble up as
    # a failure.
  end

end

Given(/^I then opt to change FRA(\d+)$/) do |code|

  # We can get away with just selecting the first link because currently you can
  # only select one exemption so there will only ever be one link
  @app.check_exemptions_page.remove_links.first.click
  expect(@app.add_exemption_page.exemption_checked?(code)).to be false

end

Then(/^I will be taken back to the add exemptions page$/) do
  expect(page).to have_content "Select the exemption you want to register"
end

When(/^I confirm my registration$/) do
  expect(page).to have_content("Use of your information and privacy")
  @app.declaration_page.submit
end

Then(/^I will see confirmation my registration has been submitted$/) do
  expect(@app.confirmation_page).to have_content "Registration submitted"
end

And(/^give "([^"]*)" as the contact$/) do |name|

  # Correspondence contact name page
  @app.correspondence_contact_name_page.submit(
    full_name: name,
    position: "Project Manager"
  )

  # Correspondence contact telephone page
  @app.correspondence_contact_telephone_page.submit(
    telephone_number: "01234567899"
  )

  # Correspondence contact email address page
  expect(@app.correspondence_contact_email_page).to have_content("What’s the email address")
  @app.correspondence_contact_email_page.submit(
    email: Quke::Quke.config.custom["accounts"]["SystemUser"]["username"],
    confirm_email: Quke::Quke.config.custom["accounts"]["SystemUser"]["username"]
  )

  # Email someone else page
  expect(@app.email_someone_else_page).to have_content("confirmation email")
  @app.email_someone_else_page.submit_button.click

end

Then("I complete a partnership registration") do
  partnership_registration
end
