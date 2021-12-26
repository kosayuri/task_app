class HistroysController < ApplicationController
  def create
    @histroy = Histroy.new(start_day:params[:start_day], end_day:params[:end_day], count:params[:count], user_id:@current_user.id, room_id:params[:room_id])
    if @histroy.save
      flash[:notice] = "予約が完了しました"
      redirect_to("/")
    else
      flash[:notice] = "予約できませんでした"
      @room = Room.find_by(id:@histroy.room_id)
      @user = User.find_by(id:@room.user_id)
      render("rooms/show")
    end
  end

  def index
    @histroy = Histroy.all
    @room = Room.all
  end
end
