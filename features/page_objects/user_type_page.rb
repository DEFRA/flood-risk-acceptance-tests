class UserTypePage < SitePrism::Page

  elements(:org_types, "input[name='user_type[org_type]']")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    org_types.find { |btn| btn.value == args[:org_type] }.click if args.key?(:org_type)

    submit_button.click
  end

end
