# frozen_string_literal: true

When(/^I "([^"]*)" a submitted registration$/) do |action|

  # search page
  @app.search_page.nav_bar.home_link.click
  @app.search_page.search_field.set @exemption_number
  @app.search_page.search_button.click
  @app.search_page.view_first_search_result.click

  # registration page
  @app.registration_page.submit(
    action: action.to_sym
  )

  # Select the matching action and then complete the resulting page
  case action
  when "approve"
    @app.approve_registration_page.submit(
      asset_found: true,
      salmonid_river: true,
      comment: "All good here"
    )
  when "reject"
    @app.reject_registration_page.submit(
      comment: "Computer says no"
    )
  when "withdraw"
    @app.withdraw_registration_page.submit(
      comment: "Thought it was a different exemption service"
    )
  end

end
