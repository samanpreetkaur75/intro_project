class BreedsController < ApplicationController
  def index
    @breeds = Breed.all
  end

  def show
    @breed = Breed.find(params[:id])
    @images = @breed.images
  end
end
