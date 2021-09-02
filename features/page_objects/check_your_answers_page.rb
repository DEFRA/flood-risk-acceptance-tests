# frozen_string_literal: true

class CheckYourAnswersPage < BasePage

  element(:back_link, ".back-link")

  def submit
    submit_button.click
  end

end
