class ReviewsController < ApplicationController

  def index
    @product = Product.find(params[:product_id])
    @reviews = @product.reviews
  end

  def show
    @review = Review.find(params[:id_review])
  end

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end


  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    @review.body = params[:review][:body]
    @review.score = params[:review][:score]
    @review.user_id = params[:product_id]
    @review.product_id = @product.id
    if @review.save
      redirect_to product_path(params[:product_id])
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    @review = Review.find(params[:id_review])
  end


  def update
    @review = Review.find(params[:id_review])
    if @review.update(review_params)
      redirect_to reviews_path(current_user, @review.product) #request_path(@reviews)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id_review])
    @review.destroy
    redirect_to :products, status: :see_other
  end


  private

  # Only allow a list of trusted parameters through.

  def review_params
    params.require(:review).permit(:body, :score)
  end

  private
  def request_params2
    params.permit(:body, :score)
  end

end

