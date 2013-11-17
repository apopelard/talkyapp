class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
  end

  def create
    @user = User.new
    @user.username = params[:username]
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.location = params[:location]
    @user.picture_url = params[:picture_url]
    @user.email = params[:email]
    @user.last_visit = params[:last_visit]

    if @user.save
      redirect_to users_url, notice: "User created successfully."
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.username = params[:username]
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.location = params[:location]
    @user.picture_url = params[:picture_url]
    @user.email = params[:email]
    @user.last_visit = params[:last_visit]

    if @user.save
      redirect_to users_url, notice: "User updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy

    redirect_to users_url, notice: "User deleted."
  end
end
