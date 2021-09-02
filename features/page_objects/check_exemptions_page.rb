# frozen_string_literal: true

class CheckExemptionsPage < BasePage

  element(:add_another_exemption, "input[name='Add another exemption']")
  elements(:remove_links, "a[data-method='delete']")

end
