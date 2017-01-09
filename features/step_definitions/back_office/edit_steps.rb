When(/^I withdraw a submitted registration$/) do
  @app.search_page.nav_bar.home_link.click
  @app.search_page.search_field.set @exemption_number
  @app.search_page.search_button.click
  @app.search_page.view_first_search_result.click
  @app.registration_details_page.withdraw_registration.click
  @app.withdraw_page.submit(
  	withdraw_comment: "Test withdrawn registration")
end