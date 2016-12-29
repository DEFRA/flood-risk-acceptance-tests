class BackOfficeHomePage < SitePrism::Page

  # This takes the app_host set for Capybara (which is expected to be the public
  # version of the site set in the .config.yml) and converts it to the admin
  # equivalent. The intended outcome is we go from
  # https://my-service.org.gov.uk to https://admin-my-service.org.gov.uk
  # N.B. set as a class method because its intended caller is set_url(), which
  # is also a class method.
  def self.convert_url
    host_url = Capybara.app_host
    prefix = "https://admin-"

    # We check whether the url starts with either https or http (case
    # insenstive). In both cases we replace that the prefix above.
    admin_url = if host_url =~ %r{https://}i
                  host_url.gsub(%r{https://}i, prefix)
                elsif host_url =~ %r{http://}i
                  host_url.gsub(%r{http://}i, prefix)
                end
    admin_url
  end

  # This call needs to come after we have defined our convert_url function
  # else it will be unable to find it.
  set_url("#{BackOfficeHomePage.convert_url}/")

end
