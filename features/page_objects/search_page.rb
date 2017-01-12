class SearchPage < SitePrism::Page

  element(:alert_success, "div.alert-success[role='alert']", text: "successfully signed in")

  element(:search_field, "input#search")
  element(:search_status_dropdown, "select#search_status")

  element(:search_button, "input[type='submit'][value='Search']")

  element(:view_first_search_result, ".btn-primary")

  element(:registration_status, "tr:nth-child(1) .label-danger")

  section(:nav_bar, AdminNavBarSection, ".add-bottom-margin .container")

end
