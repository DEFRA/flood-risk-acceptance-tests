# frozen_string_literal: true

When(/^I search for an? "([^"]*)" registration$/) do |action|
  @app.search_page.select_search_option(action)
end

When("I search for the registration") do
  @app.search_page.nav_bar.home_link.click
  @app.search_page.submit(search_value: @registration_number)
end

When("I select the registration from the search results") do
  @app.search_page.view_first_search_result.click
end

When(/^all search results will have an? "([^"]*)" status$/) do |action|
  expect(@app.search_page).to have_search_results_status
  @app.search_page.search_results_status.each { |result| expect(result.text).to eq(action) }
end
