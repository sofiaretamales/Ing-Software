require "test_helper"

class RequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = User.new(name: 'Juan Pérez',
                     email: "juan@gmail.com",
                     phone: 958072804,
                     password: 12345678)
    @user.save
  end

  teardown do
    Rails.cache.clear
  end

  test "should not save request without info" do
    request = Request.new
    assert_not request.save, "Saved the request without info"
  end

  test "should not save request without status" do
    request = @user.requests.new(description: "Solicitud de florero de Krea",
                                 request_date: "2023-04-25"
                                )
    assert_not request.save, "Saved the request without status"
  end

  test "should not save the request if request_date is not in date format" do
    request = @user.requests.new(description: "Solicitud de florero de Krea",
                                 request_date: "240-05-2023",
                                 status: "Pendiente"
                                )
    assert_not request.save, "Saved the request with request_date not in date format"
  end

end
