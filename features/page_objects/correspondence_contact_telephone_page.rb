# frozen_string_literal: true

class CorrespondenceContactTelephonePage < SitePrism::Page

  element(:back_link, ".back-link")

  element(
    :telephone_number,
    "input[name='correspondence_contact_telephone[telephone_number]']"
  )

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    telephone_number.set(args[:telephone_number]) if args.key?(:telephone_number)

    submit_button.click
  end

end
