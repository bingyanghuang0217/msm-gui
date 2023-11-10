class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def insert
    @the_movie = Movie.new
    @the_movie.title = params.fetch("query_title")
    @the_movie.year = params.fetch("query_year")
    @the_movie.duration = params.fetch("query_duration")
    @the_movie.description = params.fetch("query_description")
    @the_movie.image = params.fetch("query_image")
    @the_movie.director_id = params.fetch("query_director_id")
    @the_movie.save
    redirect_to("/movies")
  end

  def modify
    the_id = params.fetch("path_id")
    @the_movie = Movie.find(the_id)
    @the_movie.title = params.fetch("query_title")
    @the_movie.year = params.fetch("query_year")
    @the_movie.duration = params.fetch("query_duration")
    @the_movie.description = params.fetch("query_description")
    @the_movie.image = params.fetch("query_image")
    @the_movie.director_id = params.fetch("query_director_id")
    @the_movie.save
    redirect_to("/movies/#{@the_movie.id}")
  end

  def delete
    the_id = params.fetch("path_id")
    @the_movie = Movie.find(the_id)
    @the_movie.destroy
    redirect_to("/movies")
  end

end

