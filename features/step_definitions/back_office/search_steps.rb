# frozen_string_literal: true

When(/^I search for an? "([^"]*)" registration$/) do |action|
  @app.search_page.select_search_option(action)
end

When(/^all search results will have an? "([^"]*)" status$/) do |action|
  expect(@app.search_page).to have_search_results_status
  @app.search_page.search_results_status.each { |result| expect(result.text).to eq(action) }
end
