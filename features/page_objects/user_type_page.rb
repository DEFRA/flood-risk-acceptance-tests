# frozen_string_literal: true

class UserTypePage < BasePage

  elements(:org_types, "input[name='business_type_form[business_type]'][class='govuk-radios__input']", visible: false)

  def submit(args = {})
    org_types.find { |btn| btn.value == args[:org_type] }.click if args.key?(:org_type)

    submit_button.click
  end

end
