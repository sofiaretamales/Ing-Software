require "test_helper"

class ProductTest < ActiveSupport::TestCase


  teardown do
    Rails.cache.clear
  end

  test "should not save product without info" do
    product = products(:two)
    assert_not product.save, "Saved the product without info"
  end

  test "should not save product with price as a negative integer" do
    product = products(:three)
    assert_not product.save, "Saved the product with price as a negative integer"
  end

  test "should not save product without name" do
    product = products(:four)
    assert_not product.save, "Saved the product without name"
  end

  test "should not save product without description" do
    product = products(:five)
    assert_not product.save, "Saved the product without description"
  end

  test "should not save product without price" do
    product = products(:six)
    assert_not product.save, "Saved the product without price"
  end

  test "should not save product without seller" do
    product = products(:seven)
    assert_not product.save, "Saved the product without seller"
  end

  test "should not save product with price as a string" do
    product = products(:eight)
    assert_not product.save, "Saved the product with price as a string"
  end

  test "should not save product without category" do
    product = products(:nine)
    assert_not product.save, "Saved the product without category"
  end

end
