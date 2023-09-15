class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    user = User.find_or_create_by(email: params[:product][:email]) do |user|
      user.first_name = params[:product][:first_name]
      user.phone = params[:product][:phone]
      user.password = (params[:product][:first_name] + params[:product][:phone])
    end

    @product = user.products.build(product_params)

    if @product.save
      @product.images.each do |image|
        image.attach(params[:product][:images][image])
      end

      redirect_to product_url(@product), notice: "Product was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      redirect_to product_url(@product), notice: "Product was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: "Product was successfully destroyed."
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :phone, :first_name, :email, :category ,:active_storage_attachment, :active_text_attribute, images: [])
  end
end
