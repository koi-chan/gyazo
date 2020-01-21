class Api::V1::ImagesController < ApplicationController
  before_action :set_api_v1_image, only: [:show, :edit, :update, :destroy]

  # GET /api/v1/images
  # GET /api/v1/images.json
  def index
    @api_v1_images = Api::V1::Image.all
  end

  # GET /api/v1/images/1
  # GET /api/v1/images/1.json
  def show
  end

  # GET /api/v1/images/new
  def new
    @api_v1_image = Api::V1::Image.new
  end

  # GET /api/v1/images/1/edit
  def edit
  end

  # POST /api/v1/images
  # POST /api/v1/images.json
  def create
    @api_v1_image = Api::V1::Image.new(api_v1_image_params)

    respond_to do |format|
      if @api_v1_image.save
        format.html { redirect_to @api_v1_image, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @api_v1_image }
      else
        format.html { render :new }
        format.json { render json: @api_v1_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/images/1
  # PATCH/PUT /api/v1/images/1.json
  def update
    respond_to do |format|
      if @api_v1_image.update(api_v1_image_params)
        format.html { redirect_to @api_v1_image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @api_v1_image }
      else
        format.html { render :edit }
        format.json { render json: @api_v1_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/images/1
  # DELETE /api/v1/images/1.json
  def destroy
    @api_v1_image.destroy
    respond_to do |format|
      format.html { redirect_to api_v1_images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_image
      @api_v1_image = Api::V1::Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_image_params
      params.fetch(:api_v1_image, {})
    end
end
