class PhotosController<ApplicationController

  def index 
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({:created_at=>:desc})
    render({:template => "photos_templates/index.html.erb"})
  end

  def show
    the_url= params.fetch("path_id")
    matching_photo = Photo.where({:id => the_url})
    @this_photo = matching_photo.first
    if @this_photo == nil
      redirect_to("/photos")
    else
      render({:template => "photos_templates/show.html.erb"})
    end
  end

  def add_photo
    image_input = params.fetch("input_new_image")
    caption_input = params.fetch("input_new_caption")
    owner_input = params.fetch("input_owner")

    new_photo = Photo.new
    new_photo.image = image_input
    new_photo.caption = caption_input
    new_photo.owner_id = owner_input

    new_photo.save

    new_re = "/photos/"+new_photo.id.to_s
    redirect_to("/photos/")
  end

  def update_photo
    the_url= params.fetch("path_id")
    matching_photo = Photo.where({:id => the_url})
    @this_photo = matching_photo.first

    image_input = params.fetch("input_image")
    caption_input = params.fetch("input_caption")

    @this_photo.image = image_input
    @this_photo.caption = caption_input

    @this_photo.save

    new_re = "/photos/"+the_url
    redirect_to(new_re)
  end
  
  def delete_photo
    the_url= params.fetch("path_id")
    matching_photo = Photo.where({:id => the_url})
    the_photo = matching_photo.at(0)

    the_photo.destroy
    redirect_to("/photos")
  end

  def add_comment
    the_url= params.fetch("path_id")
 
    photo_id_comment = params.fetch("input_comment_id")
    author_input = params.fetch("input_author_comment_id")
    comment_input = params.fetch("input_comment")

    @this_comment = Comment.new
    @this_comment.photo_id = photo_id_comment
    @this_comment.body = comment_input
    @this_comment.author_id = author_input

    @this_comment.save

    new_re = "/photos/"+the_url
    redirect_to(new_re)
  end
end
