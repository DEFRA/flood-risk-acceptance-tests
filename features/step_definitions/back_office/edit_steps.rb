When(/^I withdraw a submitted registration$/) do
  @app.search_page.nav_bar.home_link.click
  @app.search_page.search_field.set @exemption_number
  @app.search_page.search_button.click
  @app.search_page.view_first_search_result.click
end