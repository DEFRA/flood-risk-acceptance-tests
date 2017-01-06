When(/^I withdraw a submitted registration$/) do
  @app.search_page.nav_bar.click_on	
  @app.search_page.search_field.input '@exemption_number'
  @app.search_page.search_button.click
  @app.search_page.view_first_search_result.click
end