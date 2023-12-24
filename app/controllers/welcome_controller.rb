class WelcomeController < ApplicationController
  def index
    @products = Product.includes(:images_attachments, :user).order(created_at: :desc).limit(40)
  end
end
