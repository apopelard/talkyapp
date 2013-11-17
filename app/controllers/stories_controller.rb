class StoriesController < ApplicationController

  def index
    @stories = Story.all
  end

  def show
    @story = Story.find_by(id: params[:id])
  end

  def new
  end

  def create
    @story = Story.new
    @story.name = params[:name]
    @story.description = params[:description]
    @story.address1 = params[:address1]
    @story.address2 = params[:address2]
    @story.postcode = params[:postcode]
    @story.city = params[:city]
    @story.state = params[:state]
    @story.country = params[:country]
    @story.latitude = params[:latitude]
    @story.longitute = params[:longitute]
    @story.picture_url = params[:picture_url]
    @story.audio_url = params[:audio_url]
    @story.rating = params[:rating]
    @story.user_id = params[:user_id]

    if @story.save
      redirect_to stories_url, notice: "Story created successfully."
    else
      render 'new'
    end
  end

  def edit
    @story = Story.find_by(id: params[:id])
  end

  def update
    @story = Story.find_by(id: params[:id])
    @story.name = params[:name]
    @story.description = params[:description]
    @story.address1 = params[:address1]
    @story.address2 = params[:address2]
    @story.postcode = params[:postcode]
    @story.city = params[:city]
    @story.state = params[:state]
    @story.country = params[:country]
    @story.latitude = params[:latitude]
    @story.longitute = params[:longitute]
    @story.picture_url = params[:picture_url]
    @story.audio_url = params[:audio_url]
    @story.rating = params[:rating]
    @story.user_id = params[:user_id]

    if @story.save
      redirect_to stories_url, notice: "Story updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @story = Story.find_by(id: params[:id])
    @story.destroy

    redirect_to stories_url, notice: "Story deleted."
  end
end
