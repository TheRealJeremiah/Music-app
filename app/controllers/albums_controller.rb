class AlbumsController < ApplicationController
  before_action do
    redirect_to new_session_url unless logged_in?
  end

  def new
    @bands = Band.all
    @band = Band.find(params[:band_id])
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @bands = Band.all
    @album = Album.find(params[:id])
    render :edit
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_tp album_url(@album)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    Album.destroy(params[:id])
    redirect_to bands_url
  end

  private

  def album_params
    params.require(:album).permit(:band_id, :name, :live)
  end
end
