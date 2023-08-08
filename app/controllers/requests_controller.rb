class RequestsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
      @product = Product.find(params[:product_id])
      @request = @user.requests.new(request_params2)
      @request.description = @product.description
      @request.status = "Pendiente"
  end

  def create
    @user = User.find(params[:user_id])
      @product = Product.find(params[:product_id])
      @request = @user.requests.new(request_params2)
      @request.products.append(@product)
      @request.description = @product.description
      @request.status = "Pendiente"
      if @request.save
        redirect_to request_path(@user, @request)
      else
        render :new, status: :unprocessable_entity
      end
  end

  def index
    @user = User.find(params[:user_id])
      @requests = @user.requests
  end

  def show
    @user = User.find(params[:user_id])
      @request = @user.requests.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
      @request = @user.requests.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
      @request = @user.requests.find(params[:id])
      if @request.update(request_params)
        redirect_to request_path(current_user, @request)
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @user = User.find(params[:user_id])
      @request = @user.requests.find(params[:id])
      @request.destroy
      redirect_to requests_path(current_user, @request), status: :see_other
  end

    private
  def request_params
    params.require(:request).permit(:request_date, :status, :description)
    end

    private
  def request_params2
    params.permit(:request_date, :status, :description)
    end
end
