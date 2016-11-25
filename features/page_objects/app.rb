# Represents all pages in the application. Was created to avoid needing to
# create individual instances of each page throughout the steps.
# https://github.com/natritmeyer/site_prism#epilogue
class App

  # Using an attr_reader automatically gives us a my_app.last_page method
  attr_reader :last_page

  # /
  def front_office_home_page
    @last_page = FrontOfficeHomePage.new
  end

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

  # /steps/individual_name
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

end
