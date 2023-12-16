class EventsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    p "*" * 125
    p params
  end
end
