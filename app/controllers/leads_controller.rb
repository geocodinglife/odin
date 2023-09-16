class LeadsController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @leads = current_user.products.map do |product|
      product.leads.map do |lead|
        lead
      end
    end
  end

  def create
    product = Product.find_by(id: params[:product_id])

    Lead.transaction do
      user = User.find_or_create_by(email: params[:lead][:email]) do |user|
        user.first_name = params[:lead][:first_name]
        user.phone = params[:lead][:phone]
        user.password = (params[:lead][:first_name] + params[:lead][:phone])
      end

      lead = Lead.create!(product_id: params[:product_id], user_id: user.id)
      room = Room.create!(name: "#{product.name} - #{params[:lead][:first_name]}")

      UserRoom.create!([{room: room, user: user}, {room: room, user: product.user}])

      if lead.save!
        # send message to seller of this Lead
        # this message should be send by text.
        # product beling to use find it by product id
        # send_text_to_seller(seller_lead)
        flash[:notice] = "Lead was successfully created."
        redirect_to lead_path(lead.id)
      else
        flash[:notice] = "We can create you Lead."
        redirect_to root
      end
    end
  end

  def show
  end
end
