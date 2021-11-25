# frozen_string_literal: true

class RegistrationNumberPage < BasePage

  element(:reg_number, "input#company-number-form-company-number-field")

  def submit(args = {})
    reg_number.set(args[:reg_number]) if args.key?(:reg_number)

    submit_button.click
  end
end
