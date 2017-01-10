# Represents all pages in the application. Was created to avoid needing to
# create individual instances of each page throughout the steps.
# https://github.com/natritmeyer/site_prism#epilogue
class App

  # Using an attr_reader automatically gives us a my_app.last_page method
  attr_reader :last_page

  # FRONT OFFICE SPECIFIC PAGES
  # /
  def front_office_home_page
    @last_page = FrontOfficeHomePage.new
  end

  # JOURNEY PAGES
  # /steps/add_exemptions
  def add_exemption_page
    @last_page = AddExemptionPage.new
  end

  # /steps/check_exemptions
  def check_exemptions_page
    @last_page = CheckExemptionsPage.new
  end

  # /steps/grid_reference
  def grid_reference_page
    @last_page = GridReferencePage.new
  end

  # /steps/user_type
  def user_type_page
    @last_page = UserTypePage.new
  end

  # /steps/limited_company_number
  # /steps/limited_liability_partnership_number
  def registration_number_page
    @last_page = RegistrationNumberPage.new
  end

  # /steps/local_authority
  # /steps/limited_company_name
  # /steps/limited_liability_partnership_name
  # /steps/individual_name
  # /steps/partnership
  # /steps/other
  def organisation_name_page
    @last_page = OrganisationNamePage.new
  end

  # /steps/individual_postcode
  def postcode_page
    @last_page = PostCodePage.new
  end

  # /steps/individual_address
  def address_page
    @last_page = AddressPage.new
  end

  # /steps/partnership_details
  def partnership_details_page
    @last_page = PartnershipPage.new
  end

  # /steps/correspondence_contact_name
  def correspondence_contact_name_page
    @last_page = CorrespondenceContactNamePage.new
  end

  # /steps/correspondence_contact_telephone
  def correspondence_contact_telephone_page
    @last_page = CorrespondenceContactTelephonePage.new
  end

  # /steps/correspondence_contact_email
  def correspondence_contact_email_page
    @last_page = CorrespondenceContactEmailPage.new
  end

  # /steps/email_someone_else
  def email_someone_else_page
    @last_page = EmailSomeoneElsePage.new
  end

  # /steps/check_your_answers
  def check_your_answers_page
    @last_page = CheckYourAnswersPage.new
  end

  # /steps/declaration
  def declaration_page
    @last_page = DeclarationPage.new
  end

  # /steps/confirmation
  def confirmation_page
    @last_page = ConfirmationPage.new
  end

  # BACK OFFICE SPECIFIC PAGES
  # /
  def back_office_home_page
    @last_page = BackOfficeHomePage.new
  end

  # / (when not signed in)
  def login_page
    @last_page = LoginPage.new
  end

  # / (once signed in)
  def search_page
    @last_page = SearchPage.new
  end

  def registration_details_page
    @last_page = RegistrationDetailsPage.new
  end

  # admin/enrollment_exemptions/[id]/withdraw
  def withdraw_registration_page
    @last_page = WithdrawRegistrationPage.new
  end

  # /admin/enrollment_exemptions/[id]/approve
  def approve_registration_page
    @last_page = ApproveRegistrationPage.new
  end

  # /admin/enrollment_exemptions/[id]/reject
  def reject_registration_page
    @last_page = RejectRegistrationPage.new
  end

end
