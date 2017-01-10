When(/^I "([^"]*)" a submitted registration$/) do |action|
  @app.search_page.nav_bar.home_link.click
  @app.search_page.search_field.set @exemption_number
  @app.search_page.search_button.click
  @app.search_page.view_first_search_result.click
  @app.registration_details_page.submit(
    action_type: action.to_sym
  )
  @app.send("#{action}_registration_page").submit
end
