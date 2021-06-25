# frozen_string_literal: true

class PostCodePage < SitePrism::Page

  element(:postcode, "input[id$='-postcode-field']")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    postcode.set(args[:postcode]) if args.key?(:postcode)

    submit_button.click
  end
end
