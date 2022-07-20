class PhotosController<ApplicationController

  def index 
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({:created_at=>:desc})
    render({:template => "photos_templates/index.html.erb"})
  end

  def show
    render({:template => "photos_templates/show.html.erb"})
  end
end
