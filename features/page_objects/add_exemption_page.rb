# frozen_string_literal: true

class AddExemptionPage < SitePrism::Page

  elements(:exemptions, "input[class=govuk-radios__input]", visible: false)
  elements(:exemption_label, "div[label='check box']")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    exemptions.find { |chk| chk["value"] == args[:exemption].to_s }.click if args.key?(:exemption)

    submit_button.click
  end

  def exemption_checked?(code)
    return false if code.nil?

    exemptions.find { |chk| chk["data-code"] == code }.checked?
  end

end
