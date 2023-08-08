require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end


  teardown do
    Rails.cache.clear
  end

  test "should show all products" do
    get products_path
    assert_response :success
  end

  test "should create a product" do
    assert_difference("Product.count") do
      post products_url, params: { product: {name: "Florero",
      description: "Florero de vidrio, tamaño pequeño.",
      seller: "Krea",
      price: 200,
      category: "Hogar"} }
    end
    assert_redirected_to product_path(Product.last)
  end

  test "should delete a product" do
    product = products(:one)
    product.save
    assert_difference("Product.count", -1) do
      delete product_url(product)
    end
    assert_redirected_to products_url
  end

  test "should show all technology products" do
    get technology_path
    assert_response :success
  end

  test "should show all fashion products" do
    get fashion_path
    assert_response :success
  end

  test "should show all house products" do
    get house_path
    assert_response :success
  end

  test "should show all footwear products" do
    get footwear_path
    assert_response :success
  end

  test "should update a product" do
    @product = Product.new(name: "Florero",
                           description: "Florero de vidrio, tamaño pequeño.",
                           seller: "Krea",
                           price: 200,
                           category: "Hogar")
    @product.save
    put product_url(:id => @product.id, product: {name: "Florero",
    description: "Florero de vidrio, tamaño pequeño.",
    seller: "Krea",
    price: 2000,
    category: "Hogar"})
    assert_equal 2000, Product.find(@product.id).price
    assert_redirected_to product_url
  end

  test "should not create a product and render error" do
    assert_no_difference("Product.count") do
      post products_url, params: { product: {name: "Florero",
      description: "Florero de vidrio, tamaño pequeño.",
      seller: "Krea",
      category: "Hogar"} }
    end
  end
    
end
