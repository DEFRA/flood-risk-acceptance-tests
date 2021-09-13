# frozen_string_literal: true

class RegistrationPage < BasePage

  element(:edit_address, "#registration-details [href$='/edit']")
  element(:registration_status, "#status")
  element(:business_type, "#business-type")
  element(:operator_name, "#operator-name")
  element(:operator_address, "#address")

  element(:exemption_number, "#exemption-number")
  element(:grid_ref, "#grid-reference")
  element(:site_description, "#site-description")
  element(:partner_one_details, "#partner-1")
  element(:partner_two_details, "#partner-2")
  element(:correspondence_details, "#correspondence-contact-details")
  element(:secondary_contact_details, "#secondary-contact-details")

  element(:edit_registration, "#update-enrollment-exemption-status")
  element(:change_status, "a[href$='change_status']")
  element(:withdraw, "a[href$='withdraw']")
  element(:in_progress, "a[href$='in_progress']")
  element(:approve, "a[href$='approve']")
  element(:reject, "a[href$='reject'")

  def submit(args = {})
    click_button(args[:action]) if args.key?(:action)
  end

  private

  # rubocop:disable Metrics/CyclomaticComplexity
  def click_button(action)
    case action
    when :edit_registration
      edit_registration.click
    when :change_status
      change_status.click
    when :withdraw
      withdraw.click
    when :in_progress
      in_progress.click
    when :approve
      approve.click
    when :reject
      reject.click
    when :change_ad_classification
      change_ad_classification_btn.click
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

end
