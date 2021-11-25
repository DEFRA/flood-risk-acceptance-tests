# frozen_string_literal: true

class CorrespondenceContactNamePage < BasePage

  element(:full_name, "#contact-name-form-contact-name-field")
  element(:position, "#contact-name-form-contact-position-field")

  def submit(args = {})
    full_name.set(args[:full_name]) if args.key?(:full_name)
    position.set(args[:position]) if args.key?(:position)

    submit_button.click
  end

end
