# frozen_string_literal: true

# A set of helper steps, of more use when developing new features and not
# specific to any given feature or scenario.

# Use this in features where you'd like to insert a pause between steps. Useful
# if you're trying to understand what selectors to use for an element but need
# the page to be in a certain state for example
Given(/^I pause for (\d+) seconds$/) do |seconds|

  sleep(seconds.to_i)

end
