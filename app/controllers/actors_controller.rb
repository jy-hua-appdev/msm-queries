class ActorsController < ApplicationController

  def index
    @list_of_actors = Actor.all 

    render({ :template => "actor_templates/index.html.erb"})
  end

end