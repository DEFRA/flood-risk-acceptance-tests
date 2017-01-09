class RegistrationDetailsPage < SitePrism::Page

element(:edit_address, "#registration-details .btn:first-of-type")
element(:edit_registration, "#update-enrollment-exemption-status")
element(:change_status, :xpath, ".//*[@id='actions']/p[2]/a")
element(:withdraw_registration, :xpath, ".//*[@id='actions']/p[3]/a")
element(:in_progress, :xpath, ".//*[@id='actions']/p[4]/a")
element(:approve_registration, :xpath, ".//*[@id='actions']/p[5]/a")
element(:reject_registration, :xpath, ".//*[@id='actions']/p[5]/a")
element(:change_ad_classification, "#change-assisted-digital")

element(:registration_status, :xpath, ".//*[@id='exemption-details']/div[1]/div/span[2]")

end








