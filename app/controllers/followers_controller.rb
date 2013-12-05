class FollowersController < ApplicationController

  def index
    @followers = Follower.all
  end

  def show
    @follower = Follower.find_by(id: params[:id])
  end

  def new
    @users = User.all
  end

  def create
    @follower = Follower.new
    @follower.user_id = current_user.id
    @follower.following_id = params[:fid]
    @follower.favorite = nil

    if @follower.save
      redirect_to users_url, notice: "You are now following #{User.find_by(id: params[:fid]).full_name}"
    else
      render 'new'
    end
  end

  def edit
    @follower = Follower.find_by(id: params[:id])
  end

  def update
    @follower = Follower.find_by(id: params[:id])
    @follower.user_id = params[:user_id]
    @follower.following_id = params[:following_id]
    @follower.favorite = params[:favorite]

    if @follower.save
      redirect_to followers_url, notice: "Follower updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @follower = Follower.find_by(user_id: current_user.id, following_id: params[:id])
    @follower.destroy

    redirect_to users_url, notice: "You are not following #{User.find_by(id: params[:id]).full_name} anymore"
  end
end
