# frozen_string_literal: true

class CorrespondenceContactEmailPage < BasePage

  element(:email, "input#correspondence-contact-email-email-address-field")
  element(:confirm_email, "input#correspondence-contact-email-email-address-confirmation-field")

  def submit(args = {})
    email.set(args[:email]) if args.key?(:email)
    confirm_email.set(args[:confirm_email]) if args.key?(:confirm_email)

    submit_button.click
  end

end
