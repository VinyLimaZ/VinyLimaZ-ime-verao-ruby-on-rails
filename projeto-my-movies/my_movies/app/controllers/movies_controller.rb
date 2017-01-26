class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find params[:id]
    rescue ActiveRecord::RecordNotFound
      not_found @movie
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new movie_params
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find params[:id]
    rescue ActiveRecord::RecordNotFound
      not_found @movie
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update(movie_params)

    if @movie.save
      redirect_to movie_path @movie
    else
      render :edit
    end

    rescue ActiveRecord::RecordNotFound
      not_found @movie
  end

  private
    def not_found obj
      obj = nil
      render file: "#{Rails.root}/public/404.html", status: 404
    end

    def movie_params
      params.require(:movie).permit(:title, :release_date, :description)
    end
end
