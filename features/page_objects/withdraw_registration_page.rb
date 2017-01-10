class WithdrawRegistrationPage < SitePrism::Page

  element(:withdraw_comment, "#admin_enrollment_exemptions_withdraw_comment")
  element(:submit_button, "input[name='commit']")

  	def submit()
    	withdraw_comment.set "This is test"
       	submit_button.click
    end


end
