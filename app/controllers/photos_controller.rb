class PhotosController<ApplicationController

  def index 
    render({:template => "photos_templates/index.html.erb"})
  end

  def show
    render({:template => "photos_templates/show.html.erb"})
  end
end
