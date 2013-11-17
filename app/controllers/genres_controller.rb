class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find_by(id: params[:id])
  end

  def new
  end

  def create
    @genre = Genre.new
    @genre.story_id = params[:story_id]
    @genre.category_id = params[:category_id]

    if @genre.save
      redirect_to genres_url, notice: "Genre created successfully."
    else
      render 'new'
    end
  end

  def edit
    @genre = Genre.find_by(id: params[:id])
  end

  def update
    @genre = Genre.find_by(id: params[:id])
    @genre.story_id = params[:story_id]
    @genre.category_id = params[:category_id]

    if @genre.save
      redirect_to genres_url, notice: "Genre updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @genre = Genre.find_by(id: params[:id])
    @genre.destroy

    redirect_to genres_url, notice: "Genre deleted."
  end
end
