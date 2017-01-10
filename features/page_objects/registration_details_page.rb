require 'active_support/inflector'

class RegistrationDetailsPage < SitePrism::Page

  element(:edit_address, "#registration-details .btn:first-of-type")
  element(:edit_registration, "#update-enrollment-exemption-status")
  element(:change_status, :xpath, ".//*[@id='actions']/p[2]/a")
  element(:withdraw_registration, :xpath, ".//*[@id='actions']/p[3]/a")
  element(:in_progress, :xpath, ".//*[@id='actions']/p[4]/a")
  element(:approve_registration, :xpath, ".//*[@id='actions']/p[5]/a")
  element(:reject_registration, :xpath, ".//*[@id='actions']/p[5]/a")
  element(:change_ad_classification, "#change-assisted-digital")
  element(:registration_status, :xpath, ".//*[@id='exemption-details']/div[1]/div/span[2]")

  elements(:action_buttons, ".actions .btn")

  def submit(action_type:)
    action_button = action_buttons.find do |e|
      e.text.downcase.include?(action_type.to_s.humanize.downcase)
    end
    action_button.click
  end

end
