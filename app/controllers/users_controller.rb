class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update,:follower,:followed]
 
  
  def new
    @user = User.new
  end
  
  def show # 追加
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end

  # def show
  # ##privateで設定済み。
  # end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    if my_user
        render "edit"
      else
        render "show"
    end
  end
  
  def update
    if my_user
      if @user.update(user_params)
        flash[:success] = "プロフィールを更新しました"
        redirect_to @user
      else
        render "edit"
      end
    else
      render "show"
    end
  end

  def follower
    @followers = @user.follower_users
  end

  def followed
    @followeds = @user.following_users
  end


  private

  def user_params
    params.require(:user).permit(:name,:email,:region,:profile,:password,:password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def my_user
    @user == current_user
  end
  
end
