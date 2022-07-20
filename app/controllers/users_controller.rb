class UsersController<ApplicationController

  def index 
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })
    render({:template => "users_templates/index.html.erb"})
  end

  def show
    render({:template => "users_templates/show.html.erb"})
  end
end