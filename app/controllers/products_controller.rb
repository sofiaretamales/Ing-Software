class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
      if @product.save
          #Si se guarda el producto, redirigimos a products/:id
        redirect_to @product
      else
          #Mostramos new.html.erb con el código de error
        render :new, status: :unprocessable_entity
      end
  end

  def edit
    @product = Product.find(params[:id])
  end
    
  def update
    @product = Product.find(params[:id])
      if @product.update(product_params)
        redirect_to @product
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @product = Product.find(params[:id])
      @product.destroy
      redirect_to :products, status: :see_other
  end

  def technology
    @products = Product.all
    @technology = []
    @products.each do |product|
      if product.category == "Tecnología"
        @technology.append(product)
      end
    end
  end

  def house
    @products = Product.all
    @house = []
    @products.each do |product|
      if product.category == "Hogar"
        @house.append(product)
      end
    end
  end

  def footwear
    @products = Product.all
    @footwear = []
    @products.each do |product|
      if product.category == "Calzado"
        @footwear.append(product)
      end
    end
  end

  def fashion
    @products = Product.all
    @fashion = []
    @products.each do |product|
      if product.category == "Moda"
        @fashion.append(product)
      end
    end
  end

    private
  def product_params
    params.require(:product).permit(:name, :description, :seller, :price, :category, :image)
    end
end
