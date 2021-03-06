# frozen_string_literal: true

class CheckYourAnswersPage < SitePrism::Page

  element(:back_link, ".back-link")

  element(:submit_button, "input[name='commit']")

  def submit
    submit_button.click
  end

end
