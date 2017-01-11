class RegistrationPage < SitePrism::Page

  element(:edit_address, "#registration-details .btn:first-of-type")

  element(:registration_status, "div#exemption-details span.label")

  element(:edit_registration_btn, "#update-enrollment-exemption-status")
  element(:change_status_btn, "a[href$='change_status']")
  element(:withdraw_btn, "a[href$='withdraw']")
  element(:in_progress_btn, "a[href$='in_progress']")
  element(:approve_btn, "a[href$='approve']")
  element(:reject_btn, "a[href$='reject'")
  element(:change_ad_classification_btn, "#change-assisted-digital")

  def submit(args = {})
    click_button(args[:action]) if args.key?(:action)
  end

  private

  # rubocop:disable Metrics/CyclomaticComplexity
  def click_button(action)
    case action
    when :edit_registration
      edit_registration_btn.click
    when :change_status
      change_status_btn.click
    when :withdraw
      withdraw_btn.click
    when :in_progress
      in_progress_btn.click
    when :approve
      approve_btn.click
    when :reject
      reject_btn.click
    when :change_ad_classification
      change_ad_classification_btn.click
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

end
