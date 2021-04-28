class ActorsController < ApplicationController

  def index
    @list_of_actors = Actor.all 

    render({ :template => "actor_templates/index.html.erb"})
  end

  def actor_details
    the_id = params.fetch("an_id")
    @the_actor = Actor.where({ :id => the_id }).first
    @actor_characters = Character.where({ :actor_id => the_id })
    render({ :template => "actor_templates/actor_details.html.erb"})
  end

end