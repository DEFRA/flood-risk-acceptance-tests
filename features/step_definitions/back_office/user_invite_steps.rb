# frozen_string_literal: true

When("I invite a new user to access the service") do
  @app.search_page.nav_bar.view_users_option.click
  @app.users_page.invite_users.click
  @app.invite_user_page.submit(
    user: "Data user",
    email: "test@example.com"
  )
end

When("I will get confirmation that an invite email has been sent") do
  expect(@app.users_page.notification).to have_content("An invitation email has been sent")
end
