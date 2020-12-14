class FriendshipsController < ApplicationController
  # GET /friendships
  # GET /friendships.json
  def index
    if user_signed_in?
      @friend_requests = current_user.friend_requests
      @pending_friends = current_user.pending_friends
      @friends = current_user.friends
    else
      redirect_to root_path
    end
    @friend = User.where('id=?', :friend_id)
  end

  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = Friendship.create(friendship_params)
    redirect_to users_path
  end

  def update
    friendship = current_user.inverse_friendships.find_by(user_id: params[:friend_id])
    friendship.status = true
    if friendship.save
      Friendship.create(user_id: current_user.id, friend_id: params[:friend_id], status: true)
      redirect_to friendships_path
    end
  end

  def destroy
    friendship = current_user.inverse_friendships.find_by(user_id: params[:friend_id])
    redirect_to friendships_path if friendship.destroy
  end

  private
  def set_friendship
    @friendship = Friendship.find(params[:id])
  end

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :status)
  end
end
