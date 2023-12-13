# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @products = Product.includes(:images_attachments).order(created_at: :desc).limit(40)
  end
end
