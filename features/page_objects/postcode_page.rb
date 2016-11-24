class PostCodePage < SitePrism::Page

  element(:local_authority_postcode, "input[id='local_authority_postcode_postcode']")
  element(:limited_company_postcode, "input[id='limited_company_postcode_postcode']")
  element(:llp_postcode, "input[id='limited_liability_partnership_postcode_postcode']")
  element(:individual_postcode, "input[id='individual_postcode_postcode']")
  element(:other_postcode, "input[id='other_postcode_postcode']")
  element(:partnership_postcode, "input[id='partnership_postcode_postcode']")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    local_authority_postcode.set(args[:local_authority_postcode]) if args.key?(:local_authority_postcode)
    limited_company_postcode.set(args[:limited_company_postcode]) if args.key?(:limited_company_postcode)
    llp_postcode.set(args[:llp_postcode]) if args.key?(:llp_postcode)
    individual_postcode.set(args[:individual_postcode]) if args.key?(:individual_postcode)
    other_postcode.set(args[:other_postcode]) if args.key?(:other_postcode)
    partnership_postcode.set(args[:partnership_postcode]) if args.key?(:partnership_postcode)

    submit_button.click
  end

end
