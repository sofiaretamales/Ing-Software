
require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
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

  test "should get a list with all reviews from the product" do
    get "/reviews/:user_id/#{@user.id}/reviews"
    assert_response :success
  end


  test "should get to new page" do
    @review = @product.reviews.new(body: "Muy buen producto",
                                   score: 5)
    @review.save
    get new_review_path(@user, @product, @review)
    assert_response :success
  end


  test "should create a review" do
    assert_difference("Review.count") do
      post "/reviews/#{@user.id}/#{@product.id}/reviews", params: { review: {body: "Muy buen producto", score: 5} }
    end
    assert_redirected_to product_path(@product)
  end



end

