class ArtworksController < ApplicationController
  def index
    artwork = Artwork.all
    render json: artwork
  end

  def create
    artwork = Artwork.new(check_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.update(check_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.delete
    render json: artwork 
  end
  
  private
  def check_params
    params.require(:artwork).permit(:title, :img_url, :artist_id)
  end

end
