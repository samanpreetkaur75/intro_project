class ImagesController < ApplicationController
  def index
      @breed = Breed.find(params[:breed_id])
      @images = @breed.images
  end
end
