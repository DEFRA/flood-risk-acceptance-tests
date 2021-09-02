# frozen_string_literal: true

class AddressPage < BasePage

  element(:show_list, "input#address_match_selection")
  element(:results_dropdown, "select[id$='uprn-field']")

  element(:cannot_find_address_link, "fieldset+ p .change-postcode-button")

  element(:address_premises, "input#address_premises")
  element(:street_address, "input#address_street_address")
  element(:address_locality, "input#address_locality")
  element(:address_city, "input#address_city")

  def submit(args = {})
    results_dropdown.select(args[:result]) if args.key?(:result)

    address_premises.set(args[:address_premises]) if args.key?(:address_premises)
    street_address.set(args[:street_address]) if args.key?(:street_address)
    address_locality.set(args[:address_locality]) if args.key?(:address_locality)
    address_city.set(args[:address_city]) if args.key?(:address_city)

    submit_button.click
  end

end
