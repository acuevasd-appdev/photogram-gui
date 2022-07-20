class UsersController<ApplicationController

  def index 
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })
    render({:template => "users_templates/index.html.erb"})
  end

  def show
    the_username = params.fetch("path_username")
    matching_usernames = User.where({:username => the_username})
    @this_user = matching_usernames.first
    if @this_user == nil
      redirect_to("/")
    else
      render({:template => "users_templates/show.html.erb"})
    end
  end
end
