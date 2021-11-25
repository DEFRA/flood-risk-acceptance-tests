# frozen_string_literal: true

class AddressPage < BasePage

  element(:show_list, "input#address_match_selection")
  element(:results_dropdown, "select[class='govuk-select']")

  element(:cannot_find_address_link, "a[href$='/company-address-lookup/skip_to_manual_address']")

  element(:address_premises, "input#company-address-manual-form-company-address-premises-field")
  element(:street_address, "input#company-address-manual-form-company-address-street-address-field")
  element(:address_locality, "input#company-address-manual-form-company-address-locality-field")
  element(:address_city, "input#company-address-manual-form-company-address-city-field")

  def submit(args = {})
    results_dropdown.select(args[:result]) if args.key?(:result)

    address_premises.set(args[:address_premises]) if args.key?(:address_premises)
    street_address.set(args[:street_address]) if args.key?(:street_address)
    address_locality.set(args[:address_locality]) if args.key?(:address_locality)
    address_city.set(args[:address_city]) if args.key?(:address_city)

    submit_button.click
  end

end
