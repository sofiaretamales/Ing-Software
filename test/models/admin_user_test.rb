require "test_helper"

class AdminUserTest < ActiveSupport::TestCase

  teardown do
    Rails.cache.clear
  end

  test "should not save admin user without info" do
    admin = AdminUser.new
    assert_not admin.save, "Saved the admin user without info"
  end

  test "should not save admin user without email format" do
    #admin = admin_users(admin1)
    admin = AdminUser.new(email: "hola", password: "contrasena123")
    assert_not admin.save, "Saved the admin user without email format"
  end

  test "should not save admin user with nul password" do
    admin = AdminUser.new(email: "kyliejenner@gmail.com", password: "")
    assert_not admin.save, "Saved the admin user with nul password"
  end

end
