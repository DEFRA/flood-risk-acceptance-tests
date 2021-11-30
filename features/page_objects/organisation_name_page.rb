# frozen_string_literal: true

class OrganisationNamePage < BasePage

  element(:org_name, "input[id$='-name-field']")

  def submit(args = {})
    org_name.set(args[:org_name]) if args.key?(:org_name)

    submit_button.click
  end
end
