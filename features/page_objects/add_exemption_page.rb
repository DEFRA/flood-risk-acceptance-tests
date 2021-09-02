# frozen_string_literal: true

require_relative "base_page"

class AddExemptionPage < BasePage

  elements(:exemptions, "input[class=govuk-radios__input]", visible: false)
  elements(:exemption_label, "div[label='check box']")

  def submit(args = {})
    exemptions.find { |chk| chk["value"] == args[:exemption].to_s }.click if args.key?(:exemption)

    submit_button.click
  end

  def exemption_checked?(code)
    return false if code.nil?

    exemptions.find { |chk| chk["value"] == code.to_s }.checked?
  end

end
