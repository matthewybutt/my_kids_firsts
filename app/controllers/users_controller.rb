class UsersController < ApplicationController
  before_action :authorize, except: [:index, :show, :new, :create]
  before_action :set_user, only: [:index, :show, :edit, :update]

  def index
   @users = current_user
  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You're signed up!"
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      render 'new'
    end
  end

    def update
    @user = current_user

    if @user.update(user_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  private
    def set_user
      @user = current_user #User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
