# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @products = Product.last(40)
  end
end
