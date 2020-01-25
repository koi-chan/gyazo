class Api::V1::ImagesController < ApiController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /api/v1/images
  # GET /api/v1/images.json
  def index
    @images = Image.all
  end

  # GET /api/v1/images/1
  # GET /api/v1/images/1.json
  def show
  end

  # GET /api/v1/images/new
  def new
    @image = Image.new
  end

  # GET /api/v1/images/1/edit
  def edit
  end

  # POST /api/v1/images
  # POST /api/v1/images.json
  def create
    @image = Image.new(image: params[:imagedata])

    if @image.save
      url_base = "#{request.protocol}#{request.host_with_port}"
#      render json: {
#        'image_id': @image.digest,
#        'permalink_url': "#{url_base}#{@image.image.url}",
#        'thumb_url': "#{url_base}#{@image.image.url}",
#        'url': "#{url_base}#{@image.image.url}",
#        'type': 'png'
#      }
      render plain: "#{url_base}#{@image.image.url}"
    else
      render json: {
        status: :failed
      }
    end

#    respond_to do |format|
#      if @image.save
#        format.html { redirect_to @image, notice: 'Image was successfully created.' }
#        format.json { render :show, status: :created, location: @image }
#      else
#        format.html { render :new }
#        format.json { render json: @image.errors, status: :unprocessable_entity }
#      end
#    end
  end

  # PATCH/PUT /api/v1/images/1
  # PATCH/PUT /api/v1/images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/images/1
  # DELETE /api/v1/images/1.json
  def destroy
    if @image.destroy
      render json: {
        'image_id': @image.digest,
        'type': @image.image.extention
      }
    else
      render :show
    end
#    respond_to do |format|
#      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
#      format.json { head :no_content }
#    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_image
    @image = Image.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def image_params
    params.
      require(:image).
      permit(:imagedata)
  end
end
