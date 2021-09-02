# frozen_string_literal: true

When(/^I register a flood risk activity exemption for a customer$/) do

  @app.search_page.nav_bar.new_option.click

  @app.add_exemption_page.submit(exemption: 1)

  expect(page).to have_content("FRA2")
  expect(page).to have_content("Confirm your exemption")
  @app.check_exemptions_page.submit_button.click

  expect(@app.grid_reference_page).to have_content("activity")
  @app.grid_reference_page.submit(
    grid_reference: "ST 58132 72695",
    description: "Location of activity"
  )

  # User type page
  @app.user_type_page.submit(org_type: "individual")

  # Organisation name page
  @app.organisation_name_page.submit(org_name: "Tina Turner")

  # Postcode page
  @app.postcode_page.submit(postcode: "BS1 5AH")

  # Address page - select address from post code lookup list
  expect(page).to have_content("I can’t find the address in the list")
  @app.address_page.submit(
    result: "ENVIRONMENT AGENCY, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
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
  expect(@app.correspondence_contact_email_page).to have_content("What’s the email address")
  @app.correspondence_contact_email_page.submit(
    email: Quke::Quke.config.custom["accounts"]["SystemUser"]["username"],
    confirm_email: Quke::Quke.config.custom["accounts"]["SystemUser"]["username"]
  )

  # Email someone else page
  expect(@app.email_someone_else_page).to have_content("confirmation email")
  @app.email_someone_else_page.submit(
    email: Quke::Quke.config.custom["accounts"]["SystemUser"]["username2"],
    confirm_email: Quke::Quke.config.custom["accounts"]["SystemUser"]["username2"]
  )

  # Check your answers page
  expect(@app.check_your_answers_page).to have_content("Check your answers")
  @app.check_your_answers_page.submit

  @app.declaration_page.declaration_button.click

  @exemption_number = @app.confirmation_page.exemption_number.text
end

Then(/^I will see confirmation the registration has been submitted$/) do

  expect(page).to have_content "Registration submitted"
end

Then(/^I will see the registration is "([^"]*)"$/) do |action|

  expect(@app.registration_page.registration_status.text).to eq(action)

end

When(/^I export registrations for today$/) do
  @app.search_page.nav_bar.export_option.click

  # finds today's date and saves them for use in export from date
  # 'To' date defaults to today's date is isn't required
  time = Time.new

  @year = time.year
  @month = time.strftime("%B")
  @day = time.day

  @app.enrollment_exports_page.submit(
    from_day: @day,
    from_month: @month,
    from_year: @year
  )
  expect(@app.enrollment_exports_page).to have_export_alert
end

Then(/^I will see the exported registrations file status as complete$/) do

  refresh_cnt = 0
  loop do
    if @app.enrollment_exports_page.latest_export_status.text == "Complete"
      refresh_cnt = 20
    else
      refresh_cnt += 1
      sleep(5)
      @app.enrollment_exports_page.refresh.click
    end
    break unless refresh_cnt < 20
  end

  expect(@app.enrollment_exports_page.latest_export_status.text).to eq("Complete")
end
