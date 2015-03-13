class TracksController < ApplicationController
  before_action do
    redirect_to new_session_url unless logged_in?
  end

  def new
    @albums = Album.all
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @albums = Album.all
    @track = Track.find(params[:id])
    render :edit
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  private

  def track_params
    params.require(:track).permit(:album_id, :name, :lyrics, :bonus)
  end
end
