# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @products = Product.includes(:images_attachments).last(40)

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
end
