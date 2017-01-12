class AdminNavBarSection < SitePrism::Section

  # IMPORTANT! Because of the way the nav-bar works in order to see the options
  # you first have to click the relevant menu. For example to 'see' i.e. be able
  # to click the export_option you first have to click on registrations_menu
  # @app.search_page.nav_bar.registrations_menu.click
  # @app.search_page.nav_bar.search_option.click
  # This is just a factor of how bootstrap works.
  #
  # The CSS selectors were identified by using the Chrome addin
  # http://selectorgadget.com/. You can also test them using the Chrome
  # developer tools. Open them up, select the elements tab and then ctrl/cmd+f
  # You should get an input field into which you can enter your selector and
  # confirm/test its working. See
  # https://developers.google.com/web/updates/2015/05/search-dom-tree-by-css-selector

  # Finally the root selector for this section appears to be
  # ".add-bottom-margin .container". So when adding it to your pages use
  # section(:nav_bar, AdminNavBarSection, ".add-bottom-margin .container")

  element(:home_link, "a.navbar-brand")

  element(:registrations_menu, ".dropdown:nth-child(1) .dropdown-toggle")
  element(:search_option, ".dropdown-menu li:nth-child(1) a")
  element(:new_option, ".dropdown-menu li:nth-child(2) a")
  element(:export_option, ".dropdown-menu li~ li+ li a")

  element(:users_menu, ".dropdown+ .dropdown .dropdown-toggle")
  element(:view_users_option, ".dropdown-menu li:nth-child(1) a")
  element(:invite_user_option, ".dropdown-menu li+ li a")

  element(:sign_out_link, "a[href='/users/sign_out']")

end
