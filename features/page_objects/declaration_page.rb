# frozen_string_literal: true

class DeclarationPage < SitePrism::Page

  element(:declaration_button, "input[name='commit']")

  def submit
    declaration_button.click
  end
end
