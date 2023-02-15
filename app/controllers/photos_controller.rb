class PhotosController < ApplicationController

  def index
    matching_photos = Photo.all
      
    @list_of_photos = matching_photos.order({ :created_at => :desc })
    render({ :template => "photos_templates/index.html.erb"})
  end

  def show

    #{"path_photos"=>"777"}
    url_id = params.fetch("path_photos")
    matching_photos = Photo.where({ :id => url_id})

    @the_photo = matching_photos.at(0)

    render({ :template => "photos_templates/show.html.erb"})
  end

  def delete 
    the_id = params.fetch("path_deletephotos")

    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.at(0)

    the_photo.destroy

    

    #render({ :template => "photos_templates/delete.html.erb"})

    redirect_to("/photos")
  end
end
