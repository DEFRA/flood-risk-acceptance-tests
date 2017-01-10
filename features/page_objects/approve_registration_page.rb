class ApproveRegistrationPage < SitePrism::Page
  element(:asset_found, "#admin_enrollment_exemptions_approve_asset_found")
  element(:salmonid_river, "#admin_enrollment_exemptions_approve_salmonid_river_found")
  element(:comment, "#admin_enrollment_exemptions_approve_comment")
  element(:submit_button, "input[name='commit']")

  def submit
    asset_found.click
    salmonid_river.click
    comment.set "This is a test"
    submit_button.click
  end

end
