# frozen_string_literal: true

class CorrespondenceContactTelephonePage < BasePage

  element(
    :telephone_number,
    "#contact-phone-form-contact-phone-field"
  )

  def submit(args = {})
    telephone_number.set(args[:telephone_number]) if args.key?(:telephone_number)

    submit_button.click
  end

end
