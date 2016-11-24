Given(/^I am an external user$/) do
  @app = App.new
  @app.front_office_home_page.load
end

Given(/^I register exemption FRA(\d+)$/) do |id|
  @app.add_exemption_page.submit(exemption: "FRA#{id}")

  expect(page).to have_content("FRA#{id}")
  @app.check_exemptions_page.submit_button.click

  @app.grid_reference_page.submit(
    grid_reference: 'ST 58132 72695',
    description: 'Location of activity'
  )
end

When(/^I confirm my registration$/) do
  @app.declaration_page.declaration_button.click
end

Then(/^I will see confirmation my registration has been submitted$/) do
  expect(page).to have_content 'Registration submitted '
end
