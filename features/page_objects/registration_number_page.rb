# frozen_string_literal: true

class RegistrationNumberPage < BasePage

  element(:ltd_reg_number, "input#limited-company-number-registration-number-field")
  element(:llp_reg_number, "input#limited-liability-partnership-number-registration-number-field")

  def submit(args = {})
    ltd_reg_number.set(args[:ltd_reg_number]) if args.key?(:ltd_reg_number)
    llp_reg_number.set(args[:llp_reg_number]) if args.key?(:llp_reg_number)

    submit_button.click
  end
end
