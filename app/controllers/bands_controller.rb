class BandsController < ApplicationController
  before_action do
    redirect_to new_session_url unless logged_in?
  end

  def index
    @bands = Band.all
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render new
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render new
    end
  end

  def destroy
    Band.destroy(params[:id])
    redirect_to bands_url
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
