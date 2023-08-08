require "test_helper"
require 'devise'
require 'warden'


class Admin::ProductsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    @admin_user = admin_users(:admin1) 
    sign_in @admin_user
  end

  test 'should get index' do
    get :index
    assert_response :success
  end
  
  end