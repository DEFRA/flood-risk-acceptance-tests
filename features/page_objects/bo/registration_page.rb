# frozen_string_literal: true

class RegistrationPage < BasePage

  element(:edit_address, "#registration-details [href$='/edit']")
  # TODO: update this selector
  element(:registration_status, "#registration-details+ .govuk-table .govuk-table__row:nth-child(1) .govuk-table__cell")
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
