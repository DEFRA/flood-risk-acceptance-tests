# frozen_string_literal: true

class SearchPage < BasePage
  section(:nav_bar, AdminNavBarSection, ".govuk-header__container")

  element(:alert_success, ".govuk-notification-banner__heading", text: "successfully signed in")

  element(:search_field, "input#search")
  element(:search_status_dropdown, "select#search_status")

  element(:search, "button[type='submit']")
  element(:results_dropdown, "select[id='search-status-field']")

  element(:view_first_search_result, ".btn-primary")

  element(:registration_status, "tr:nth-child(1) .label-danger")

  elements(:search_results_status, ".govuk-table__cell.govuk-table__header")

  def select_search_option(action)
    results_dropdown.select(action)
    search.click
  end

  def check_all_results_for_status(action)
    search_results_status.each { |result| result.text.to eg(action) }
  end

end
