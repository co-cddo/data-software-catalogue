# Use factories where the properties of object are specific to the spec.
# For example, if a spec needs to test what happens when a user's email contains
# a specific string such as 'george'.
#
# Factories can also be simpler to use when testing combinations of objects.

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
