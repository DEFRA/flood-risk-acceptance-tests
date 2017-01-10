class RejectRegistrationPage < SitePrism::Page

  element(:comment, "#admin_enrollment_exemptions_reject_comment")

  element(:submit_button, "input[name='commit']")

  def submit
    comment.set "This is a test"
    submit_button.click
  end

end
