class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/new"
    end
  end

  def show
    @user = User.find(params[:id])
    render 'show'
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id]).update(user_params)
    redirect_to "/users/#{params[:id]}"
  end

  def destroy
    user = User.find(params[:id]).delete
    session[:user_id] = nil
    redirect_to "/sessions/new"
  end

  private
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
