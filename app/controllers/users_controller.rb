class UsersController < ApplicationController 

  def index
    matching_users = User.all
    
    @list_of_users = matching_users.order({ :username => :asc })
    render ({:template => "users_templates/index.html.erb"})
  end

  def show
    #Parameters: {"path_username"=>"anisa"}
    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username=> url_username})

    @the_user = matching_usernames.at(0)
    
    render({ :template => "users_templates/show.html.erb"})
  end

  def add
    @url_usernamea = params.fetch("input_username")

    @the_user = User.new

    @the_user.username = @url_usernamea

    @the_user.save

    # matching_usernamesa = User.where({ :username=> url_usernamea})

    # @the_usera = matching_usernamesa.at(0)
    # render({:template => "users_templates/add.html.erb"})

    redirect_to("/users/#{@the_user.username}")
  end

  def update_user
    #@url_username_update = params.fetch("")

    #@the_user = User.new

    #@the_user.username = @url_usernamea_update

    #@the_user.save
    #redirect_to("/users/#{@the_user.username}")

    render({:template => "users_templates/update_user.html.erb"})
  end
end
