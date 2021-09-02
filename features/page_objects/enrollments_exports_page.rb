# frozen_string_literal: true

class EnrollmentExportsPage < BasePage

  element(:export_alert, ".govuk-notification-banner__heading")
  element(:from_day, "#admin_enrollment_export_from_date_3i")
  element(:from_month, "#admin_enrollment_export_from_date_2i")
  element(:from_year, "#admin_enrollment_export_from_date_1i")

  element(:to_day, "#admin_enrollment_export_to_date_3i")
  element(:to_month, "#admin_enrollment_export_to_date_2i")
  element(:to_year, "#admin_enrollment_export_to_date_1i")

  element(:request_export, "input[name='commit']")

  element(:refresh, ".btn-sm")

  element(:latest_export_file, ".enrollment_export:first-of-type a")

  element(:latest_export_status, ".enrollment_export:first-of-type span")

  section(:nav_bar, AdminNavBarSection, ".govuk-header__container")

  def submit(args = {})
    from_day.select(args[:from_day]) if args.key?(:from_day)
    from_month.select(args[:from_month]) if args.key?(:from_month)
    from_year.select(args[:from_year]) if args.key?(:from_year)
    # defaults to current day's date if left blank
    to_day.select(args[:to_day]) if args.key?(:to_day)
    to_month.select(args[:to_month]) if args.key?(:to_month)
    to_year.select(args[:to_year]) if args.key?(:to_year)
    request_export.click
  end
end
