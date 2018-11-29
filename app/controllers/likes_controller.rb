class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:like_id])
    current_user.like(micropost)
    flash[:success] = 'このポストをお気に入りに登録しました。'
    # redirect_to micropost.user
    # redirect_to current_user
    redirect_back(fallback_location: root_url)
  end

  def destroy
    micropost = Micropost.find(params[:like_id])
    current_user.unlike(micropost)
    flash[:success] = 'このポストのお気に入りを解除しました。'
    redirect_back(fallback_location: root_url)
  end
end
