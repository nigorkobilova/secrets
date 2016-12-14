class SecretsController < ApplicationController
  before_action :require_login, only: [:create, :destroy]
  def index
    @secrets = Secret.all
    render 'index'
  end

  def create
    @user = User.find(session[:user_id])
    @secret = @user.secrets.create(content: params[:"New Secret"])
    redirect_to "/users/#{@user.id}"
  end

  def destroy
    secret = Secret.find(params[:id])
    user = secret.user
    secret.destroy if secret.user == current_user
    redirect_to :back
  end
end
