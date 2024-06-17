class UsersController < ApplicationController

  def index
    matching_users = User.all

    @list_of_users = matching_users.order({:username => :asc})

    render({:template=>"user_templates/index"})
  end

  def show
    url_username = params.fetch("path_username")

    matching_usernames = User.where({:username => url_username})

    @the_user = matching_usernames.first

    render({:template => "user_templates/show"})
  end

  def create
    @the_user = User.new

    username_value = params.fetch("username")

    @the_user.username = username_value

    @the_user.save

    redirect_to("/users/#{@the_user.username}")
  end

end
