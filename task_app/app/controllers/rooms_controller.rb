class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(name:params[:name], appeal:params[:appeal], money:params[:money], address:params[:address], user_id:session[:user_id], image:"home_icon.png")

    if params[:image]
      @room.image = "#{@room.id}#{File.extname(params[:image].original_filename)}"
      image = params[:image]
    end
    if @room.save
      if params[:image]
        File.binwrite("public/room_images/#{@room.image}", image.read)
      end
      flash[:notice] = "ルーム情報を登録しました"
      redirect_to("/")
    else
      flash[:notice] = "ルーム情報を登録できませんでした"
      render("rooms/new")
    end
  end

  def index
    @room = Room.where("name LIKE ?", "%#{params[:name]}%").where("address LIKE ?", "%#{params[:address]}%")

  end

  def posts
    @room = Room.where(user_id:session[:user_id])
  end

  def show
    @histroy = Histroy.new
    @room = Room.find_by(id:params[:id])
    @user = User.find_by(id:@room.user_id)
  end
end
