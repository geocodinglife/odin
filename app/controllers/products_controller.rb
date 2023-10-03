class ProductsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @categories = Category.all

    @product = Product.new

    if @product.new_record?
      default_template = <<-TEMPLATE
      <h2>Introduction</h2>
      <p>Write a brief introduction about the product here.</p>

      <h2>Features</h2>
      <ul>
        <li>Feature 1: Briefly describe this feature.</li>
        <li>Feature 2: Briefly describe this feature.</li>
        <li>Feature 3: Briefly describe this feature.</li>
      </ul>

      <h2>Conclusion</h2>
      <p>Summarize the product's main selling points and encourage a purchase or further exploration.</p>
      TEMPLATE

      @product.description = default_template
    end
  end

  def edit
  end

  def create
    email = params[:product][:email].first
    user_first_name = params[:product][:first_name].first
    user_phone = params[:product][:phone].first

    Product.transaction do
      user = User.find_or_create_by(email: email) do |user|
        user.first_name = user_first_name
        user.phone = user_phone
        user.password = (user_first_name + user_phone)
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
