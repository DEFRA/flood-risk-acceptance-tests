# frozen_string_literal: true

class WithdrawRegistrationPage < BasePage

  element(:comment, "#admin_enrollment_exemptions_withdraw_comment")
  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    comment.set args[:comment] if args.key?(:comment)

    submit_button.click
  end

end
