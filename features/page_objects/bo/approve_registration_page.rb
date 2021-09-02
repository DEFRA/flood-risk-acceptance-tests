# frozen_string_literal: true

class ApproveRegistrationPage < BasePage

  element(:asset_found, "#admin_enrollment_exemptions_approve_asset_found")
  element(:salmonid_river, "#admin_enrollment_exemptions_approve_salmonid_river_found")
  element(:comment, "#admin_enrollment_exemptions_approve_comment")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    asset_found.click if args.key?(:asset_found) && args[:asset_found]
    salmonid_river.click if args.key?(:salmonid_river) && args[:salmonid_river]
    comment.set args[:comment] if args.key?(:comment)

    submit_button.click
  end

end
