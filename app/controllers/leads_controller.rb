class LeadsController < ApplicationController
  def create
    Lead.transaction do
      user = User.find_or_create_by(email: params[:lead][:email]) do |user|
        user.first_name = params[:lead][:first_name]
        user.phone = params[:lead][:phone]
        user.password = (params[:lead][:first_name] + params[:lead][:phone])
      end

      lead = Lead.new(product_id: params[:product_id], user_id: user.id)
      # seller_phone = Product.find_by(id: params[:lead][:product_id]).user.phone
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
