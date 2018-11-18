class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  
  def index
    @products = Product.all()
  end

  def show; end

  def new
    @product = Product.new
  end
  
  def create
      @product = Product.new(product_params)
      if @product.save
        flash[:notice] = 'Produto cadastrado'
        redirect_to products_path
      else
        render :new
      end
  end

  def edit; end

  def update
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Produto atualizado'
      redirect_to products_path
    else
      render :new
    end
  end
  
  private
  
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:id, :name, :description, :unit_price, :quantity)
  end
end
