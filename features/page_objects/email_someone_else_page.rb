# frozen_string_literal: true

class EmailSomeoneElsePage < BasePage

  element(:email, "input#additional-contact-email-form-additional-contact-email-field")
  element(:confirm_email, "input#additional-contact-email-form-confirmed-email-field")

  def submit(args = {})
    email.set(args[:email]) if args.key?(:email)
    confirm_email.set(args[:confirm_email]) if args.key?(:confirm_email)

    submit_button.click
  end

end
