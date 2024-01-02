# frozen_string_literal: true

class RoomsController < ApplicationController
  before_action :set_room, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    original_data = "3b4393bafed398ba1"
    @first_reference = original_data.chars.shuffle.join
    @amount = "2490000"
    @currency = "COP"
    @wompi_integrity = ENV["WOMPI_INTEGRITY"]
    @buyer_rooms = current_user.rooms.includes(:user_rooms).all
  end

  def show
  end

  def new
    @room = Room.new
  end

  def edit
  end

  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        UserRoom.create(room: @room, user: current_user)
        format.turbo_stream do
          render turbo_stream: turbo_stream.append("user_#{current_user.id}_rooms", partial: "shared/room",
            locals: {room: @room})
        end
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("room_form", partial: "rooms/form",
            locals: {room: @room, title: "Create new room"})
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @room.update(room_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("room_#{@room.id}", partial: "shared/room", locals: {room: @room})
        end
      else
        format.html { render :edit }
        # format.turbo_stream { render turbo_stream: turbo_stream.replace("room_#{@room.id}", partial: 'rooms/form', locals: { room: @room, title: 'Edit room' }) }
      end
    end
  end

  def destroy
    @room.destroy

    respond_to do |format|
      format.html { redirect_to rooms_url, notice: "Room was successfully destroyed." }
    end
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name)
  end
end
