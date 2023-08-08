class WishlistsController < ApplicationController
  def index
    @wishlists = current_user.wishlists
  end

  def show
    @wishlist = Wishlist.find(params[:id])
  end      
    
  def create
    @wishlist = current_user.wishlists.build(wishlist_params)
    if @wishlist.save
      redirect_to wishlists_path, notice: "Producto agregado a la lista de deseos."
    else
      redirect_to wishlists_path, alert: "No se pudo agregar el producto a la lista de deseos."
    end
  end
    
  def destroy
    @wishlist = current_user.wishlists.find(params[:id])
    @wishlist.destroy
    redirect_to wishlists_path, notice: "Producto eliminado de la lista de deseos."
  end
    
      private
    
  def wishlist_params
    params.require(:wishlist).permit(:product_id)
  end

end
