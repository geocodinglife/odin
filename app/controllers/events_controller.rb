class EventsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    match_data = params["data"]["transaction"]["reference"].match(/(\w+)-(\d+)-(\d+)-(\d+)/)

    lead = Lead.where(product_id: match_data[4].to_i, user_id: match_data[3].to_i).first

    if match_data
      if params["data"]["transaction"]["status"] != "APPROVED"
        raise StandardError, "Transaction status is not APPROVED"
      end

      Payment.create!(
        status: params["data"]["transaction"]["status"],
        room_id: match_data[2].to_i,
        user_id: match_data[3].to_i,
        lead_id: lead.id,
        transaction_id: params["data"]["transaction"]["id"],
        reference: params["data"]["transaction"]["reference"],
        amount: params["data"]["transaction"]["amount_in_cents"],
        currency: params["data"]["transaction"]["currency"]
      )
    else
      raise StandardError, "String format not recognized"
    end
  end
end
