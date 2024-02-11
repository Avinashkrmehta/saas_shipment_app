class AppUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!, only: [ :new, :create, :edit, :update, :destroy]

  def index
    if params[:role] == 'delivery_partner'
      @users = AppUser.delivery_partners
    else
      @users = AppUser.all
    end
  end

  def new
    @user = AppUser.new
  end

  def show
     @user = AppUser.find(params[:id])
  end

  def create
    @user = AppUser.new(app_users_params)
    if @user.save
      flash[:notice] = 'User was successfully created.'
      redirect_to app_users_path
    else
      flash[:alert] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @user = AppUser.find(params[:id])
  end

  def update
    @user = AppUser.find(params[:id])
    if @user.update(app_users_params)
      flash[:alert] = 'User was successfully updated.'
      redirect_to app_users_path
    else
      flash[:alert] = @user.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @user = AppUser.find(params[:id])
    
    if @user.destroy
      flash[:notice] = 'User was successfully destroyed.'
      redirect_to app_users_path
    else
     flash[:alert] = @user.errors.full_messages.to_sentence
     redirect_to app_users_path 
    end
  end

  def onboard
    @user = User.find(params[:id])
      if @user.onboarded == true
        flash[:notice] = 'User is already onboarded' 
      elsif @user.update(onboarded: true)
         flash[:notice] = 'User onboarded successfully'
      else
       flash[:alert] = @user.errors.full_messages.to_sentence
      end
    redirect_to app_users_path 
  end

  def offboard
    @user = User.find(params[:id])
      if @user.onboarded == false
        flash[:notice] = 'User is already off-boarded' 
      elsif @user.update(onboarded: true)
         flash[:notice] = 'User off-boarded successfully'
      else
       flash[:alert] = @user.errors.full_messages.to_sentence
      end
    redirect_to app_users_path 
  end

  private

  def app_users_params
    params.require(:app_user).permit(:name,:email, :password, :password_confirmation, :role)
  end

  def authorize_admin!
    redirect_to unauthenticated_root_path, alert: "You are not authorized to perform this action." unless current_user.admin?
  end
end

