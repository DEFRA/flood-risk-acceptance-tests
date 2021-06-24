# frozen_string_literal: true

class PostCodePage < SitePrism::Page

  element(:local_authority_postcode, "input#local-authority-postcode-postcode-field")
  element(:ltd_company_postcode, "input#limited-company-postcode-postcode-field")
  element(:llp_postcode, "input#limited-liability-partnership-postcode-postcode-field")
  element(:individual_postcode, "input#individual-postcode-postcode-field")
  element(:other_postcode, "input#other-postcode-postcode-field")
  element(:partnership_postcode, "input#partnership-postcode-postcode-field")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    local_authority_postcode.set(args[:local_authority_postcode]) if args.key?(:local_authority_postcode)
    ltd_company_postcode.set(args[:ltd_company_postcode]) if args.key?(:ltd_company_postcode)
    llp_postcode.set(args[:llp_postcode]) if args.key?(:llp_postcode)
    individual_postcode.set(args[:individual_postcode]) if args.key?(:individual_postcode)
    other_postcode.set(args[:other_postcode]) if args.key?(:other_postcode)
    partnership_postcode.set(args[:partnership_postcode]) if args.key?(:partnership_postcode)

    submit_button.click
  end
end
