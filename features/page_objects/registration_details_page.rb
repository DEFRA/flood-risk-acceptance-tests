require "active_support/inflector"

class RegistrationDetailsPage < SitePrism::Page

  element(:edit_address, "#registration-details .btn:first-of-type")

  element(:registration_status, :xpath, ".//*[@id='exemption-details']/div[1]/div/span[2]")

  elements(:action_buttons, ".actions .btn")

  def submit(action_type:)
    action_button = action_buttons.find do |e|
      e.text.downcase.include?(action_type.to_s.humanize.downcase)
    end
    action_button.click
  end

end
