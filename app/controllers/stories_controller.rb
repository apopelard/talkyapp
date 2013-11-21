require 'open-uri'
require 'json'

class StoriesController < ApplicationController

  def index
    @stories = Story.all
  end

  def show
    @story = Story.find_by(id: params[:id])
    @latitude = @story.latitude
    @longitude = @story.longitute
  end

  def new
    @users = User.all
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

    address = "#{params[:address1]} #{params[:address2]} #{params[:city]} #{params[:state]} #{params[:postcode]} #{params[:country]}"
    url_safe_address = URI.encode(address)

    url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{url_safe_address}&sensor=false"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @story.latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    @story.longitute = parsed_data["results"][0]["geometry"]["location"]["lng"]

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
