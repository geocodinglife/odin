class ProductsController < ApplicationController
  # before_action :authenticate_user!, only: :index
  before_action :set_product, only: %i[show edit update destroy]

  def index
    category = Category.find_by(name: params[:category_name]) || Category.find_by(id: params[:category_id])

    @products = if params[:search].present?
      search_products(params[:search], category)
    elsif category.nil?
      Product.order(created_at: :desc)
    else
      category.products.order(created_at: :desc)
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @categories = Category.all
    @product = Product.new
  end

  def edit
  end

  def create
    @product = current_user.products.build(product_params)

    if @product.save
      redirect_to products_path, notice: "Product was successfully created."
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
    params.require(:product).permit(:name, :price, :category_id, :description, images: [])
  end

  def search_products(query, category)
    if category.nil?
      Product.where("name ILIKE ?", "%#{query}%").order(created_at: :desc)
    else
      category.products.where("name ILIKE ?", "%#{query}%").order(created_at: :desc)
    end
  end
end
