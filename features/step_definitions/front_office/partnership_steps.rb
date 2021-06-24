# frozen_string_literal: true

Given(/^I am a partnership$/) do
  # User type page
  @app.user_type_page.submit(org_type: "partnership")

  # Organisation name page
  @app.organisation_name_page.submit(partnership_full_name: "Fray and Bentos Associates")

  # Postcode page
  @app.postcode_page.submit(partnership_postcode: "BS1 5AH")

  # Address page - select address from post code lookup list
  expect(page).to have_content("I can’t find the address in the list")
  @app.address_page.submit(
    result: "ENVIRONMENT AGENCY, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
  )

  # Partnership details page
  # There is no continue button the first time through as you have to have 2
  # partners as a minimum
  @app.partnership_details_page.add_partner_link.click

  # Organisation name page
  @app.organisation_name_page.submit(partnership_full_name: "Fray and Bentos Associates")

  # Postcode page
  # We can just click submit because the page pre-populates the postcode lookup
  # field with the previously entered postcode
  expect(page).to have_content("BS1 5AH")
  @app.postcode_page.submit_button.click

  # Address page - select address from post code lookup list
  expect(page).to have_content("I can’t find the address in the list")
  @app.address_page.submit(
    result: "ENVIRONMENT AGENCY, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
  )

  # Partnership details page - again!
  # The continue button should now be visible
  expect(@app.partnership_details_page).to have_content("Business partners you’ve added to this registration")
  @app.partnership_details_page.submit_button.click

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
end

And(/^add "([^"]*)" as the first partner$/) do |name|

  # Organisation name page
  @app.organisation_name_page.submit(partnership_full_name: name)

  # Postcode page
  expect(page).to have_content("postcode")
  @app.postcode_page.submit(partnership_postcode: "CA11 9BP")

  # Address page - select address from post code lookup list
  expect(page).to have_content("I can’t find the address in the list")
  @app.address_page.submit(
    result: "ENVIRONMENT AGENCY, GHYLL MOUNT, GILLAN WAY, PENRITH 40 BUSINESS PARK, PENRITH, CA11 9BP"
  )

end

And(/^add "([^"]*)" as a partner$/) do |name|

  # Partnership details page
  @app.partnership_details_page.add_partner_link.click

  # Organisation name page
  @app.organisation_name_page.submit(partnership_full_name: name)

  # Postcode page
  # We can just click submit because the page pre-populates the postcode lookup
  # field with the previously entered postcode
  expect(@app.postcode_page).to have_content("the address")
  @app.postcode_page.submit_button.click

  # Address page - select address from post code lookup list
  expect(@app.address_page).to have_content("I can’t find the address in the list")
  @app.address_page.submit(
    result: "ENVIRONMENT AGENCY, GHYLL MOUNT, GILLAN WAY, PENRITH 40 BUSINESS PARK, PENRITH, CA11 9BP"
  )

end

And(/^add "([^"]*)" as the last partner$/) do |name|

  # Partnership details page
  @app.partnership_details_page.add_partner_link.click

  # Organisation name page
  @app.organisation_name_page.submit(partnership_full_name: name)

  # Postcode page
  # We can just click submit because the page pre-populates the postcode lookup
  # field with the previously entered postcode
  expect(@app.postcode_page).to have_content("What’s the address")
  @app.postcode_page.submit_button.click

  # Address page - select address from post code lookup list
  expect(@app.address_page).to have_content("I can’t find the address in the list")
  @app.address_page.submit(
    result: "ENVIRONMENT AGENCY, GHYLL MOUNT, GILLAN WAY, PENRITH 40 BUSINESS PARK, PENRITH, CA11 9BP"
  )

  # Partnership details page
  # The continue button should now be visible
  expect(@app.partnership_details_page).to have_content("Business partners you’ve added to this registration")
  @app.partnership_details_page.submit_button.click

end

But(/^then remove "([^"]*)" from the partners list$/) do |name|

  # Capybara now has built in support for accepting dialog boxes (without
  # needing to extra driver specific code or explicit waits). Simply wrap the
  # code which causes the dialog with page.accept_confirm. In essence you are
  # passing the code which causes the dialog to appear as a block to the method.
  # http://www.rubydoc.info/github/jnicklas/capybara/Capybara%2FSession%3Aaccept_confirm
  # http://stackoverflow.com/a/26348968/6117745
  # Modal seems to be closed automatically for iphones so no need to wrap in the page accept alert method
  if ARGV.any? { |word| word.include?("@iphone") }
    @app.partnership_details_page.remove_link(name).click
  else
    page.accept_alert do
      @app.partnership_details_page.remove_link(name).click
    end
  end

end

Then(/^I will just see the remaining 2 partners$/) do
  sleep(1)
  expect(@app.partnership_details_page.remove_links.length).to eq(2)
  expect(page).to have_content("Steve Rogers")
  expect(page).to have_content("Tony Stark")
end
