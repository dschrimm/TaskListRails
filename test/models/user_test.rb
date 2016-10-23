require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "Create a valid user" do
    assert users(:snoopy).valid?
  end

  test "Create a user with missing fields" do
    user = User.new
    user.name = "a"
    user.uid = 1
    user.provider = "github"
    assert_not user.valid?
  end
end
