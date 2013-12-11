require 'open-uri'
require 'json'

class StoriesController < ApplicationController

  before_action :set_story, :only => [:show, :edit, :udpate, :destroy]
  before_action :user_must_be_owner_of_story, :only => [:edit, :udpate, :destroy]

  def set_story
    @story = Story.find(params[:id])
  end

  def user_must_be_owner_of_story
    unless @story.user.id == current_user.id
      redirect_to root_url, :alert => "You are not authorized for that."
    end
  end

  def index
    if params["cat"]!="all"
      cat = Category.find_by(name: params["cat"].titleize)
      stories_list = Genre.where(category_id: cat.id)
      @stories = []
      stories_list.each do |story_id|
        @stories << Story.find(story_id.story_id)
      end
    else
      @stories = Story.all
    end
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
    @story.rating = 0
    @story.votes = 0
    @story.user_id = params[:user_id]

    if @story.save
      Category.all.each do |category|
        genre = Genre.new
        if params[category.id.to_s] == "yes"
          genre.story_id = @story.id
          genre.category_id = category.id
          genre.save
        end
      end
      redirect_to stories_url(cat: "all"), notice: "Story created successfully."
    else
      render 'new'
    end
  end

  def edit
    @story = Story.find_by(id: params[:id])
  end

  def update
    @story = Story.find_by(id: params[:id])
    if params[:v].present?
      @story.votes = @story.votes + 1
      @story.rating = (@story.rating*(@story.votes-1) + params[:v].to_i)/@story.votes
      @story.name = @story.name
      @story.address1 = @story.address1
      @story.city = @story.city
      @story.audio_url = @story.audio_url
      @story.user_id = @story.user_id
    else
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
      @story.user_id = params[:user_id]
    end

    if @story.save
      unless params[:v].present?
        Category.all.each do |category|
          genre = Genre.new
          if (params[category.id.to_s] == "yes") && (@story.categories.include?category)
          elsif (params[category.id.to_s] != "yes") && (@story.categories.include?category)
            Genre.where(story_id: @story.id.to_s).find_by(category_id: category.id.to_s).destroy
          elsif (params[category.id.to_s] == "yes")
            unless (@story.categories.include?category)
              genre.story_id = @story.id
              genre.category_id = category.id
              genre.save
            end
          end
        end
      end
      redirect_to story_url(@story.id), notice: "Story updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @story = Story.find_by(id: params[:id])
    @story.destroy

    redirect_to stories_url(cat: "all"), notice: "Story deleted."
  end
end
