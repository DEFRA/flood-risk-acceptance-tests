# frozen_string_literal: true

class EmailSomeoneElsePage < SitePrism::Page

  element(:back_link, ".back-link")

  element(:email, "input#email_someone_else_email_address")
  element(:confirm_email, "input#email_someone_else_email_address_confirmation")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    email.set(args[:email]) if args.key?(:email)
    confirm_email.set(args[:confirm_email]) if args.key?(:confirm_email)

    submit_button.click
  end

end
