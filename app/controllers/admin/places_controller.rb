class Admin::PlacesController < ApplicationController
  include Pundit
  layout "admin"
  before_action :authenticate_user!
  after_action :verify_authorized
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  # GET /places
  # GET /places.json
  def index
    authorize Place
    @places = Place.order(name: :asc).page params[:page]
  end

  # GET /places/1
  # GET /places/1.json
  def show
    authorize @place
  end

  # GET /places/new
  def new
    @place = Place.new
    authorize @place
  end

  # GET /places/1/edit
  def edit
    authorize @place
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)
    authorize @place

    respond_to do |format|
      if @place.save
        format.html { redirect_to admin_places_path, notice: 'Place was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    authorize @place
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to admin_places_path, notice: 'Place was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    authorize @place
    @place.destroy
    respond_to do |format|
      format.html { redirect_to admin_places_path, notice: 'Place was successfully destroyed.' }
    end
  end

  def search
    authorize Place
    render json: Place.where("chinese_name like ?", "%#{params[:q]}%")
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_place
    @place = Place.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def place_params
    params.require(:place).permit(:name, :chinese_name, :longitude, :latitude)
  end
end
