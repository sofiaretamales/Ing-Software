class UserController < ApplicationController
  def index
    @usuarios = User.all
  end
    
  def show
    @usuario = User.find(params[:id])
  end
    
  def new
    @usuario = User.new
  end
    
  def create
    @usuario = User.create(user_params)
      if @usuario.save
        redirect_to @usuario
      else
        render :new, status: :unprocessable_entity
      end
  end
    
  def edit
    @usuario = User.find(params[:id])
  end
    
  def update
    @usuario = User.find(params[:id])
      if @usuario.update(user_params)
        redirect_to @usuario
      else
        render :edit, status: :unprocessable_entity
      end
    end
    
  def destroy
    @usuario = User.find(params[:id])
    @usuario.destroy
    redirect_to :user, status: :see_other
  end
    
    private
  def user_params
    params.require(:user).permit(:name, :email, :phone, :image, :password)
  end
end
