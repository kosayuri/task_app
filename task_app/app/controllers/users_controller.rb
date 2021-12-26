class UsersController < ApplicationController
  def new
    @user = User.new
    @password_confirmation
  end

  def create
    @user = User.new(name:params[:name], email:params[:email], password:params[:password], image:"user_icon.png")
    @password_confirmation = params[:password_confirmation]
    if @user.save && @user.password == @password_confirmation
      flash[:notice] = "ユーザー登録しました"
      session[:user_id] = @user.id
      redirect_to("/")
    else
      if @user.password != @password_confirmation
        @error_message = "入力されたパスワードとパスワード確認の値が一致しません"
      end
      flash[:notice] = "ユーザー登録できませんでした"
      render("users/new")
    end
  end

  def edit
    @user = User.find_by(id: session[:user_id])
  end

  def update
    @user = User.find_by(id:session[:user_id])
    @password_confirmation = params[:password_confirmation]
    @user.name = params[:name]
    @user.email = params[:email]
    @user.appeal = params[:appeal]
    @user.password = params[:password]
    if params[:image]
      @user.image = "#{@user.id}#{File.extname(params[:image].original_filename)}"
      image = params[:image]
    end
    if params[:password] != ""
      if @user.save && @user.password == @password_confirmation
        if params[:image]
          File.binwrite("public/user_images/#{@user.image}", image.read)
        end
        flash[:notice] = "ユーザー情報を更新しました"
        redirect_to("/")
      else
        if @user.password != @password_confirmation
          @error_message = "入力されたパスワードとパスワード確認の値が一致しません"
        end
        flash[:notice] = "ユーザー情報を更新できませんでした"
        render("users/edit")
      end
    else
      if @user.save
        if params[:image]
          File.binwrite("public/user_images/#{@user.image}", image.read)
        end
        flash[:notice] = "ユーザー情報を更新しました"
        redirect_to("/")
      else
        if @error_message
          @error_message = nil
        end
        flash[:notice] = "ユーザー情報を更新できませんでした"
        render("users/edit")
      end
    end
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def login_form
    @user = User.new
  end

  def account
    @user = User.find_by(id: session[:user_id])
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end

end
