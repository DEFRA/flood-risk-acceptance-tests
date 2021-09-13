# frozen_string_literal: true

class AdminNavBarSection < SitePrism::Section

  element(:home_link, "#proposition-name")
  element(:search_option, "a[href='/']")
  element(:new_option, "a[href='/admin/enrollments/new']")
  element(:export_option, "a[href='/admin/enrollment_exports']")
  element(:view_users_option, "a[href='/admin/users")
  element(:sign_out_link, "a[href='/users/sign_out']")

end
