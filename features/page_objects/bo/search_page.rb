# frozen_string_literal: true

class SearchPage < BasePage
  section(:nav_bar, AdminNavBarSection, ".govuk-header__container")
  element(:search_field, "input#search-q-field")
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

  def submit(args = {})
    search_field.set(args[:search_value]) if args.key?(:search_value)
    submit_button.click
  end
end
