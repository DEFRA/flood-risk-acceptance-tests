# frozen_string_literal: true

class LoginPage < BasePage

  set_url(Quke::Quke.config.custom["urls"]["back_office"])

  element(:alert_invalid, ".govuk-notification-banner__heading", text: "Invalid email address or password")

  element(:email, "#user-email-field")
  element(:password, "#user-password-field")

  def submit(args = {})
    email.set(args[:email]) if args.key?(:email)
    password.set(args[:password]) if args.key?(:password)

    submit_button.click
  end

end
