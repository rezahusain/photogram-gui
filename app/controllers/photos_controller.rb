class PhotosController < ApplicationController

  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({:created_at => :desc})

    render({:template => "photos_templates/index"})
  end

  def show
    url_id = params.fetch("path_id")

    matching_photos = Photo.where({:id => url_id})

    @the_photo = matching_photos.at(0)

    render({:template => "photos_templates/show"})
  end

  def delete
    the_id = params.fetch("path_id")

    matching_photos = Photo.where({:id => the_id})

    the_photo = matching_photos.first

    the_photo.destroy

    redirect_to("/photos")
  end

  def create
    @the_photo = Photo.new
    image_value = params.fetch("image")
    caption_value = params.fetch("caption")
    owner_value = params.fetch("owner")
    @the_photo.image = image_value
    @the_photo.caption = caption_value
    @the_photo.owner_id = owner_value
    @the_photo.save
    redirect_to("/photos")
  end

  def update
    @current_photo = Photo.where({:id => params.fetch("path_id")}).first
    image_value = params.fetch("image")
    caption_value = params.fetch("caption")
    @current_photo.image = image_value
    @current_photo.caption = caption_value
    @current_photo.save
    redirect_to("/photos/#{@current_photo.id}")
  end
end
