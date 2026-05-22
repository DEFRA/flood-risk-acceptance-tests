# frozen_string_literal: true

class CheckYourAnswersPage < BasePage

  element(:submit_button, "#new_check_your_answers_form button[type='submit']")

  def submit
    submit_button.click
  end

end
