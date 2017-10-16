class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    user = User.find_by_id params[:followed_id]
    if user
      current_user.follow user
      redirect_to user
    else
      flash[:warning] = t "users.follow.follow_fail"
      redirect_to :back
    end
  end

  def destroy
    user = Relationship.find_by_id(params[:id]).followed
    if user
      current_user.unfollow user
      redirect_to user
    else
      flash[:warning] = t "users.follow.unfollow_fail"
      redirect_to :back
    end
  end
end
