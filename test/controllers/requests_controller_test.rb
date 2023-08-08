require "test_helper"

class RequestsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = User.new(name: 'Juan Pérez',
                     email: "juan@gmail.com",
                     phone: 958072804,
                     password: 12345678)
    @user.save

    @product = Product.new(name: "Florero",
                           description: "Florero de vidrio, tamaño pequeño.",
                           seller: "Krea",
                           price: 200,
                           category: "Hogar")
    @product.save
  end

  teardown do
    Rails.cache.clear
  end

  test "should get a list with all requests from the user" do
    get "/#{@user.id}/product_id/requests"
    assert_response :success
  end

  test "should get to edit page" do
    @request = @user.requests.new(description: "Solicitud de florero de Krea",
                                  request_date: "24-05-2023",
                                  status: "Pendiente")
    @request.save
    get edit_request_url(@user, @request)
    assert_response :success
  end

  test "should get to new page" do
    @request = @user.requests.new(description: "Solicitud de florero de Krea",
                                  request_date: "24-05-2023",
                                  status: "Pendiente")
    @request.save
    get new_request_url(@user, @product, @request)
    assert_response :success
  end

  test "should create a request" do
    assert_difference("@user.requests.count") do
      post create_request_url(:user_id => @user.id, :product_id => @product.id, params:
        {description: "Solicitud de florero de Krea",
      request_date: "2023-05-24",
      status: "Pendiente"})
    end
    assert_redirected_to request_url(@user, @user.requests.last)
  end

  ## Tests for later

  # test "should update a request" do
  #   @request = @user.requests.new(description: "Solicitud de florero de Krea",
  #   request_date: "2023-05-24",
  #   status: "Pendiente")
  #   @request.products.append(@product)
  #   @request.save
  #   put update_request_url(:user_id => @user.id, :product_id =>
  # @product.id, params: {description: "Solicitud de florero de Krea",
  #   request_date: "2023-05-24",
  #   status: "Aceptada"})
  #   assert_equal "Aceptada", Request.find(@request.id).status
  #   assert_redirected_to request_url(@user, @user.requests.last)
  # end

  # test "should delete a request" do
  #   @request = @user.requests.new(description: "Solicitud de florero de Krea",
  #   request_date: "2023-05-24",
  #   status: "Pendiente")
  #   @request.products.append(@product)
  #   @request.save
  #   assert_difference("@user.requests.count", -1) do
  #     delete "/#{@user.id}/requests/#{@request.id}"
  #   end
  #   assert_redirected_to requests_url(user_id: @user.id, product_id: @product.id)
  # end
end
