
require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  # test "the truth" do
  #   assert true
  # end

  teardown do
    Rails.cache.clear
  end

  test "should get new" do
    # @user = User.new(name: 'Juanito', email: "juanito@gmail.com", 
    #                  phone: '111111111', password: 'juanito1234')
    # @user.save
    get new_user_url
    assert_response :success
  end

  test "should update user name" do
    @user = User.new(name: 'Juanito', email: "juanito@gmail.com", 
                     phone: '111111111', password: 'juanito1234')
    @user.save
    @updated_name = "Updated"
    @user.update(name: @updated_name, email: @user.email, 
                 phone: @user.phone, password: @user.password)
  
    assert_equal @updated_name, @user.name
  end

  test "should update user email" do
    @user = User.new(name: 'Juanito', email: "juanito@gmail.com", 
                     phone: '111111111', password: 'juanito1234')
    @user.save
    @updated_email = "updated@gmail.com"
    @user.update(name: @user.name, email: @updated_email, 
                 phone: @user.phone, password: @user.password)
  
    assert_equal @updated_email, @user.email
  end

  test "should update user phone" do
    @user = User.new(name: 'Juanito', email: "juanito@gmail.com", 
                     phone: '111111111', password: 'juanito1234')
    @user.save
    @updated_phone = '111111113'
    @user.update(name: @user.name, email: @user.email, 
                 phone: @updated_phone, password: @user.password)
  
    assert_equal @updated_phone, @user.phone
  end

  test "should update user password" do
    @user = User.new(name: 'Juanito', email: "juanito@gmail.com", 
                     phone: '111111111', password: 'juanito1234')
    @user.save        
    @updated_password = "holanuevaclave"
    @user.update(name: @user.name, email: @user.email, 
                 phone: @user.phone, password: @updated_password)
  
    assert_equal @updated_password, @user.password
  end


  test "should destroy user" do
     @user = User.new(name: 'Juanito', email: "juanito@gmail.com", 
                      phone: '111111111', password: 'juanito1234')
    @user.save
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end
    assert_redirected_to user_url
   end
   
end

