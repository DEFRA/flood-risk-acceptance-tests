# frozen_string_literal: true

class RejectRegistrationPage < BasePage

  element(:comment, "#enrollment-exemption-comment-content-field")

  def submit(args = {})
    comment.set args[:comment] if args.key?(:comment)

    submit_button.click
  end

end
