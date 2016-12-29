class AddressPage < SitePrism::Page

  element(:show_list, "input[id='address_match_selection']")
  element(:results_dropdown, "select#address_match_selection")

  element(:address_premises, "input[id='address_premises']")
  element(:street_address, "input[id='address_street_address']")
  element(:address_locality, "input[id='address_locality']")
  element(:address_city, "input[id='address_city']")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    results_dropdown.select(args[:result]) if args.key?(:result)

    address_premises.set(args[:address_premises]) if args.key?(:address_premises)
    street_address.set(args[:street_address]) if args.key?(:street_address)
    telephone_number.set(args[:address_locality]) if args.key?(:address_locality)
    telephone_number.set(args[:address_city]) if args.key?(:address_city)

    submit_button.click
  end

end
