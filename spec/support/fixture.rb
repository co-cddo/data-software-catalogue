# Use fixtures for objects that will be unchanged across many specs.
# For example, a standard user is needed for authentication, but the actual
# attributes of that user aren't important. So a fixture is ideal as the
# same user can be used multiple times. If a factory was used a fresh instance
# of the user would have to be written to the database for each spec.
#
# Also use fixtures where speed is important. If running a particular spec
# is slow, converting it to use fixtures is likely to speed up the spec.
# -------------------------

FixtureError = Class.new(StandardError)
#
# Wrapper for fixtures so they can be loaded with a FactoryBot type syntax
# Usage:
#  fixture :user, :admin
#
# This will try to find a User model with an id that matches the fixture label
def fixture(model_name, label)
  model = model_name.to_s.classify.constantize
  id = ActiveRecord::FixtureSet.identify(label)
  model.find(id)
rescue ActiveRecord::RecordNotFound
  raise FixtureError, "#{label} fixture not found for #{model_name}"
rescue NameError
  raise FixtureError, "No class found for #{model_name}"
end
