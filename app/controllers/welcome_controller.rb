class WelcomeController < ApplicationController
  def index
    @products = Product.last(40)
  end
end
