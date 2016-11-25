class PartnershipPage < SitePrism::Page

  element(:add_partner_link, "a[href*='/partners/partnership/edit']")

  element(:submit_button, "input[name='commit']")

  elements(:remove_links, "a[data-method='delete']")

end
