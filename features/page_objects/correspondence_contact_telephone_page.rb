# Correspondence contact telephone page
class CorrespondenceContactTelephonePage < SitePrism::Page
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
