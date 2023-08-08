require "test_helper"

class ReviewTest < ActiveSupport::TestCase


  teardown do
    Rails.cache.clear
  end

  test "should not save review without body" do
    review = Review.new
    assert_not review.save, "Saved the review without body"
  end

  test "should not save review with score as a negative integer" do
    review = Review.new(body: "Florero de vidrio, tamaño pequeño.",
                        score: -200)
    assert_not review.save, "Saved the review with score as a negative integer"
  end

  test "should not save review with score greater than 5" do
    review = Review.new(body: "Florero de vidrio, tamaño pequeño.",
                        score: 6)
    assert_not review.save, "Saved the review with score greater than 5"
  end

  test "should not save review with score as a string" do
    review = Review.new(body: "Florero de vidrio, tamaño pequeño.",
                        score: "hola")
    assert_not review.save, "Saved the review with score as a string"
  end
end
