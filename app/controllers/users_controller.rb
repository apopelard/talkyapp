class UsersController < ApplicationController

  before_action :set_user, :only => [:show, :edit, :udpate, :destroy]
  before_action :user_must_be_owner_of_user, :only => [:edit, :udpate, :destroy]

  def set_user
    @user = User.find(params[:id])
  end

  def user_must_be_owner_of_user
    unless @user.id == current_user.id
      redirect_to root_url, :alert => "You are not authorized for that."
    end
  end

  def index
    @users = User.order("first_name").page(params[:page]).per(10)
  end

  def show

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.username = params[:username]
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.location = params[:location]
    @user.image = params[:image]
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
    @user.image = params[:image]
    @user.email = params[:email]

    if @user.save
      redirect_to user_url(params[:id]), notice: "User updated successfully."
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
