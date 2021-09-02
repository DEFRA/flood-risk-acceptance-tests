# frozen_string_literal: true

class DeclarationPage < BasePage

  element(:declaration_button, "input[name='commit']")

  def submit
    scroll_to(declaration_button)
    declaration_button.click
  end
end
