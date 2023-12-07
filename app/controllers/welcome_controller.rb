# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @products = Product.includes(:images_attachments).last(40)
  end
end
