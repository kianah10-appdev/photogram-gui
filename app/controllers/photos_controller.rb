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

  def create
    #Parameters: {"query_image"=>"jhttps://www.chicagobooth.edu/-/media/project/chicago-booth/mbalife/full-time/2020/profile-header.jpg?cx=0.42&cy=0.43&cw=940&ch=749&hash=84736E80349AE484E2F16941CF6B6AF9", "query_caption"=>"j", "query_owener_id"=>"bh"}

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")
  
    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id
  
    a_new_photo.save

    #render({ :template => "photos_templates/create.html.erb"})

    redirect_to("/photos/" + a_new_photo.id.to_s)
  end
end
