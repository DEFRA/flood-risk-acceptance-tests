class SearchPage < SitePrism::Page

  element(:alert_success, "div.alert-success[role='alert']", text: "successfully signed in")

  element(:search_field, "input#search")
  element(:search_status_dropdown, "select#search_status")

  element(:search_button, "input[type='submit'][value='Search']")

  section(:nav_bar, AdminNavBarSection, ".navbar-collapse")

end
