class LikesController < ApplicationController
  def create
    @secret = Secret.find(params[:secret_id])
    Like.create(user_id: session[:user_id], secret_id: params[:secret_id])
    redirect_to :back
  end

  def destroy
    like = Like.find_by_user_id_and_secret_id(session[:user_id], params[:secret_id])
    like.destroy
    redirect_to :back
  end
end
