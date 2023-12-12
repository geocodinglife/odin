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
    # TODO leands and products has a similar way of create a new user
    # I have to create the create of user in the users_controller.rb
    product = Product.find_by(id: params[:product_id])
    binding.break

    Lead.transaction do
      user = User.find_or_create_by(email: params[:email]) do |user|
        user.first_name = params[:first_name]
        user.phone = params[:phone]
        user.auth_secret = ROTP::Base32.random(16)
      end

      lead = Lead.create!(product_id: params[:product_id], user_id: user.id)
      room = Room.create!(name: "#{product.name} - #{params[:first_name]}")

      UserRoom.create!([{room: room, user: user}, {room: room, user: product.user}])
      if lead.save!
        # TODO I need to un comment this code when the phone service for send message is the production one.
        # Lead.send_message_to_seller(product.user)
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
