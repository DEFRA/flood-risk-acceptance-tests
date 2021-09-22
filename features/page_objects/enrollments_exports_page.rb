# frozen_string_literal: true

class EnrollmentExportsPage < BasePage

  element(:export_alert, ".govuk-notification-banner__heading")
  element(:from_day, "#enrollment_export_from_date_3i")
  element(:from_month, "#enrollment_export_from_date_2i")
  element(:from_year, "#enrollment_export_from_date_1i")

  element(:to_day, "#enrollment_export_to_date_3i")
  element(:to_month, "#enrollment_export_to_date_2i")
  element(:to_year, "#enrollment_export_to_date_1i")


  element(:refresh, ".govuk-body a[href='/admin/enrollment_exports']")

  element(:latest_export_file, ".enrollment_export:first-of-type a")

  element(:latest_export_status, ".enrollment_export:first-of-type span")

  section(:nav_bar, AdminNavBarSection, ".govuk-header__container")

  def submit(args = {})
    from_day.set(args[:from_day]) if args.key?(:from_day)
    from_month.set(args[:from_month]) if args.key?(:from_month)
    from_year.set(args[:from_year]) if args.key?(:from_year)
    # defaults to current day's date if left blank
    to_day.set(args[:to_day]) if args.key?(:to_day)
    to_month.set(args[:to_month]) if args.key?(:to_month)
    to_year.set(args[:to_year]) if args.key?(:to_year)
    submit_button.click
  end
end
