class AddExemptionPage < SitePrism::Page

  elements(:exemptions, "input[name='add_exemptions[exemption_ids]']")
  elements(:exemption_label, "div[label='check box']")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    if args.key?(:exemption)
      exemptions.find { |chk| chk['data-code'] == args[:exemption] }.click
    end

    submit_button.click
  end

  def exemption_checked?(code)
    return false if code.nil?

    exemptions.find { |chk| chk['data-code'] == code }.checked?
  end

end
