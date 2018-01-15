source "https://rubygems.org"

gem "quke"

# Rake gives us the ability to create our own commands or 'tasks' for working
# with quke.
gem "rake"

# We use rubocop in all our Ruby based projects to try and ensure consistency
# in the code we write across all our projects.
gem "rubocop", require: false

# We don't actually need a reference to chromedriver-helper for this project;
# quke itself brings it in. However when CDH updated to 1.1.0 and this project
# took the change (thanks to an automated PR from Deppbot) we found it would no
# longer run in our dev, qa and pre-prod environments.
# This is because the versions of chromedriver actually on our jenkins slave and
# the one referred to in this update are no longer the same.
# Hence by referring to it here we can lock the version to one we know allows
# this project to run in our environments.
gem "chromedriver-helper", "1.0.0"

# We don't actually need a reference to capybara for this project; quke itself
# brings it in. However when the gem updated to 2.14.1 it appears to have broken
# our ability to confirm the javascript prompt that is shown when deleting a
# partner.
# https://github.com/teamcapybara/capybara/blob/master/History.md#version-2141
# So until we understand what the problem is and how to resolve it we need to
# lock the project to a version we know works.
gem "capybara", "2.14.0"
