class CatRentalRequestsController < ApplicationController

  def index
    @cat_rental_request = CatRentalRequest.all
    render :index
  end
end
