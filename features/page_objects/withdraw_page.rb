class WithdrawPage < SitePrism::Page

element(:withdraw_comment, "#admin_enrollment_exemptions_withdraw_comment")
element(:submit_button, "input[name='commit']")

  def submit(args = {})
    withdraw_comment.set(args[:withdraw_comment]) if args.key?(:withdraw_comment)
	submit_button.click
  end

end