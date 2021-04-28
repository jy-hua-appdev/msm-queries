class DirectorsController < ApplicationController

  def index
    @list_of_directors = Director.all 

    render({ :template => "director_templates/index.html.erb"})
  end

  def eldest
    @oldest_director_name = Director.where.not({ :dob => nil}).order({ :dob => :asc }).at(0).name
    @oldest_director_dob = Director.where.not({ :dob => nil}).order({ :dob => :asc }).at(0).dob
    @oldest_director_id = Director.where.not({ :dob => nil}).order({ :dob => :asc }).at(0).id
    render({ :template => "director_templates/eldest.html.erb"})
  end

  def youngest
    @youngest_director_name = Director.where.not({ :dob => nil}).order({ :dob => :desc }).at(0).name
    @youngest_director_dob = Director.where.not({ :dob => nil}).order({ :dob => :desc }).at(0).dob
    @youngest_director_id = Director.where.not({ :dob => nil}).order({ :dob => :desc }).at(0).id
    render({ :template => "director_templates/youngest.html.erb"})
  end

  def director_details
    the_id = params.fetch("an_id")

    @the_director = Director.where({ :id => the_id }).first
    @director_movies = Movie.where({ :director_id => the_id})

    render({ :template => "director_templates/director_details.html.erb"})
  end

end