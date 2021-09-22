# frozen_string_literal: true

class PartnershipPage < BasePage

  element(:add_partner_link, "a[href$='/partner-name']")

  elements(:remove_links, "a[data-method='delete']")

  # Find a remove link by checking the data-confirm attribute for a matching
  # name.
  # Ref: actual content of data-confirm atttribute would be
  # 'Are you sure you wish to remove Jane Smith?'
  def remove_link(name)
    remove_links.detect { |link| link["data-confirm"].include?(name) }
  end

end
