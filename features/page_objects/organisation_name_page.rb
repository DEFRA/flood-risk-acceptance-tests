# Organisation name page
class OrganisationNamePage < SitePrism::Page
  element(:local_authority_name, "input[id='local_authority_name']")
  element(:limited_company_name, "input[id='limited_company_name_name']")
  element(:llp_name, "input[id='limited_liability_partnership_name_name']")
  element(:other_name, "input[id='other_name']")
  element(:partnership_full_name, "input[id='partnership_full_name']")
  element(:individual_name, "input[id='individual_name_name']")

  element(:submit_button, "input[name='commit']")

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/CyclomaticComplexity
  def submit(args = {})
    local_authority_name.set(args[:local_authority_name]) if args.key?(:local_authority_name)
    limited_company_name.set(args[:limited_company_name]) if args.key?(:limited_company_name)
    llp_name.set(args[:llp_name]) if args.key?(:llp_name)
    other_name.set(args[:other_name]) if args.key?(:other_name)
    partnership_full_name.set(args[:partnership_full_name]) if args.key?(:partnership_full_name)
    individual_name.set(args[:individual_name]) if args.key?(:individual_name)

    submit_button.click
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/CyclomaticComplexity
end
