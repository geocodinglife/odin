class LeadsController < ApplicationController
  def create
    user = User.find_or_create_by(email: params[:lead][:email]) do |user|
      user.first_name = params[:lead][:first_name]
      user.phone = params[:lead][:phone]
      user.password = (params[:lead][:first_name] + params[:lead][:phone])
    end
    
    lead = user.leads.build(product_id: params[:lead][:product_id], user_id: user.id)

    if lead.save
      flash[:notice] = 'Lead was successfully created.'
      redirect_to lead_path(lead.id)
    else
      flash[:notice] = 'We can create you Lead.'
      render 'new'
    end
  end

  def show
  end
end