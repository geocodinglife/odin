class ProductsController < ApplicationController
  # before_action :authenticate_user!, only: :index
  before_action :set_product, only: %i[show edit update destroy]

  def index
    category = Category.find_by(name: params[:category_name]) || Category.find_by(id: params[:category_id])

    @products = if category.nil?
      Product.all
    else
      category.products
    end
  end

  def show
  end

  def new
    @categories = Category.all
    @product = Product.new
  end

  def edit
  end

  def create
    email = current_user.email || params[:product][:email].first
    user_first_name = current_user.first_name || params[:product][:first_name].first
    user_phone = current_user.phone || params[:product][:phone].first

    Product.transaction do
      user = User.find_or_create_by(email: email) do |user|
        user.first_name = user_first_name
        user.phone = user_phone
        user.auth_secret = (user_first_name + user_phone)
      end

      @product = user.products.build(product_params)

      if @product.save
        redirect_to product_url(@product), notice: "Product was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
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
    params.require(:product).permit(:name, :price, :category_id, :description, images: [])
  end
end
