class RoomsController < ApplicationController
  before_action :set_room, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @rooms = current_user.rooms.all
  end

  def show
  end

  def new
    @room = Room.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @room.update(room_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace("room_#{@room.id}", partial: "shared/room", locals: {room: @room}) }
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
