class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  def index
    @products = Product.all

    render json: @products
  end

  # GET /products/1
  def show
    serialedProduct = ProductSerializer.new(@product).serializable_hash.to_json

    render json: serialedProduct
  end

  # POST /products
  def create
    @product = Product.new(product_params)
    @user = current_user[:id]
    @product.user_id = @user


    if @product.save
      render json: ProductSerializer.new(@product).serializable_hash.to_json, status: :created
    else
      error_resp = {
        error: @product.errors.full_message.to_sentence
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      serialedProduct = ProductSerializer.new(@product).serializable_hash.to_json
      render json: serialedProduct
    else
      error_resp = {
        error: @product.errors.full_message.to_sentence
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    if @product.destroy
      render json: {data: "Selected product was successfully deleted"}, status: :ok
    else
      error_resp = {
        error: "Product not found"
      }
      render json: error_resp, status: :unprocessable_entity
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :price, :description)
    end
end
