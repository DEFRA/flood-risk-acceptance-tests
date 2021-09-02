# frozen_string_literal: true

class CorrespondenceContactNamePage < BasePage

  element(:back_link, ".back-link")

  element(:full_name, "input[name='correspondence_contact_name[full_name]']")
  element(:position, "input[name='correspondence_contact_name[position]']")

  def submit(args = {})
    full_name.set(args[:full_name]) if args.key?(:full_name)
    position.set(args[:position]) if args.key?(:position)

    submit_button.click
  end

end
