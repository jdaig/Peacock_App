class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index 
    # Tenemos que hacer una variable que contiene
    # los usuarios de todo el sitio y luego representar cada uno
    # por iteración a través de ellos en la vista de índice.
    
    # @users = User.all

    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    p '**'*50
    p user_params
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Peacock!" #checar si necesita flash.now
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    # @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

    def user_params #parámetros fuertes para evitar la vulnerabilidad de asignación de masas 
      # p params.require(:user).permit(:profile)
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :profile)
    end

    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
