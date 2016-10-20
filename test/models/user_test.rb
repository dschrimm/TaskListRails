require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "Create a valid user" do
    assert users(:snoopy).valid?
  end
end
