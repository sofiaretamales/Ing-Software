require "test_helper"

class UserTest < ActiveSupport::TestCase

  def teardown
    Rails.cache.clear
  end

  test "should not save user without info" do
    user = User.new
    assert_not user.save, "Saved the user without info"
  end

  test "should not save phone number without nine digits" do
    user = users(:user1)
    assert_not user.save, "Saved the phone number without nine digits"
  end

  test "should not save user without email format" do
    user = users(:user2)
    assert_not user.save, "Saved user without email format"
  end
end
