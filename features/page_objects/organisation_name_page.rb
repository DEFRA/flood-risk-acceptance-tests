# frozen_string_literal: true

class OrganisationNamePage < SitePrism::Page

  element(:local_authority_name, "input#local_authority_name")
  element(:ltd_company_name, "input#limited_company_name_name")
  element(:llp_name, "input#limited_liability_partnership_name_name")
  element(:other_name, "input#other_name")
  element(:partnership_full_name, "input#partnership_full_name")
  element(:individual_name, "input#individual_name_name")

  element(:submit_button, "input[name='commit']")

  # rubocop:disable Metrics/CyclomaticComplexity
  def submit(args = {})
    local_authority_name.set(args[:local_authority_name]) if args.key?(:local_authority_name)
    ltd_company_name.set(args[:ltd_company_name]) if args.key?(:ltd_company_name)
    llp_name.set(args[:llp_name]) if args.key?(:llp_name)
    other_name.set(args[:other_name]) if args.key?(:other_name)
    partnership_full_name.set(args[:partnership_full_name]) if args.key?(:partnership_full_name)
    individual_name.set(args[:individual_name]) if args.key?(:individual_name)

    submit_button.click
  end
  # rubocop:enable Metrics/CyclomaticComplexity

end
