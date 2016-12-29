class FrontOfficeHomePage < SitePrism::Page

  set_url("/enrollments/new")

  element(:submit_button, "input[name='commit']")

end
