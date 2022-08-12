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

  def add_user
    username_input = params.fetch("input_new_username")

    new_user = User.new
    new_user.username = username_input
    new_user.private = TRUE
    new_user.likes_count = 0
    new_user.comments_count = 0

    new_user.save

    new_re = "/users/"+username_input
    redirect_to(new_re)
  end

  def update_user
    the_user= params.fetch("path_id")
    matching_user = User.where({:username => the_user})
    @this_user= matching_user.first

    username_input = params.fetch("update_username")

    @this_user.username = username_input

    @this_user.save
    new_re = "/users/"+username_input
    redirect_to(new_re)
  end



end
