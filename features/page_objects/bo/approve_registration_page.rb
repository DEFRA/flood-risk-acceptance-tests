# frozen_string_literal: true

class ApproveRegistrationPage < BasePage

  element(:asset_found, "#enrollment-exemption-asset-found-true-field", visible: false)
  element(:salmonid_river, "#enrollment-exemption-salmonid-river-found-true-field", visible: false)
  element(:comment, "#enrollment-exemption-comment-content-field")

  def submit(args = {})
    asset_found.click if args.key?(:asset_found) && args[:asset_found]
    salmonid_river.click if args.key?(:salmonid_river) && args[:salmonid_river]
    comment.set args[:comment] if args.key?(:comment)

    submit_button.click
  end

end
