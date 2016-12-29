class LoginPage < SitePrism::Page

  element(:alert_invalid, "div.alert-danger[role='alert']", text: "Invalid email or password")

  element(:email, "#user_email")
  element(:password, "#user_password")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    email.set(args[:email]) if args.key?(:email)
    password.set(args[:password]) if args.key?(:password)

    submit_button.click
  end

end
