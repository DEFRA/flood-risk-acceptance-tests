# frozen_string_literal: true

class PostCodePage < BasePage

  element(:postcode, "input[id$='-postcode-field']")

  def submit(args = {})
    postcode.set(args[:postcode]) if args.key?(:postcode)

    submit_button.click
  end
end
