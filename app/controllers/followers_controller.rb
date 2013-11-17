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
    @follower.user_id = params[:user_id]
    @follower.following_id = params[:following_id]
    @follower.favorite = params[:favorite]

    if @follower.save
      redirect_to followers_url, notice: "Follower created successfully."
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
    @follower = Follower.find_by(id: params[:id])
    @follower.destroy

    redirect_to followers_url, notice: "Follower deleted."
  end
end
