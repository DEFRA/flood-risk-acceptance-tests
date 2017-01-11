class RejectRegistrationPage < SitePrism::Page

  element(:comment, "#admin_enrollment_exemptions_reject_comment")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    comment.set args[:comment] if args.key?(:comment)

    submit_button.click
  end

end
