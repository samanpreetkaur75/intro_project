class BreedsController < ApplicationController
  def index
    # Initialize a base query to retrieve breeds
    @breeds = Breed.all

    # Apply search filter if a query is present
    if params[:query].present?
      @breeds = @breeds.where("LOWER(name) LIKE ?", "%#{params[:query].downcase}%")
    end

    # Apply sub breed filter if a sub_breed is selected
    if params[:sub_breed].present?
      @breeds = @breeds.where(sub_breed: params[:sub_breed])
    end

    # Implement pagination
    @breeds = @breeds.page(params[:page]).per(10)
  end

  def show
    @breed = Breed.find(params[:id])
    @images = @breed.images
  end
end
