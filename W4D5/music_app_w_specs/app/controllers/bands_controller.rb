class BandsController < ApplicationController
  # before_action :require_login

  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
