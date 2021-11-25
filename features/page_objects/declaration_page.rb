# frozen_string_literal: true

class DeclarationPage < BasePage

  def submit
    scroll_to(submit_button)
    submit_button.click
  end
end
