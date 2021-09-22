# frozen_string_literal: true

class InviteUserPage < BasePage

  element(:email, "#user-email-field")
  element(:results_dropdown, "select#user-assigned-role-field")

  def select_user_role(user)
    results_dropdown.select(user)
  end

  def submit(args = {})
    email.set(args[:email]) if args.key?(:email)
    select_user_role(args[:user])
    submit_button.click
  end

end
