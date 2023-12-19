class LeadsController < ApplicationController
  before_action :authenticate_user!
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
      lead = Lead.create!(product_id: product.id, user_id: current_user.id)
      room = Room.create!(name: "#{product.name} - #{current_user.first_name}", product: product)
      UserRoom.create!([{room: room, user: current_user}, {room: room, user: product.user}])
      Message.create!(text: "Holas estoy interesado en el #{product.name}", user_id: current_user.id, room_id: room.id)

      if lead.save!
        Lead.send_message_to_seller(product.user)
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
