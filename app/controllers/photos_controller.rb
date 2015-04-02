class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
    @report_photos = Array.new
    if current_user.admin? == false
      @user = current_user.id
      @photos = Photo.where(['user_id = ?', @user]).paginate(:page => params[:photo_page], :per_page => 5)
      @blocks = Block.where(:user_id => current_user.id)
      @user_reports = Array.new
      for block in @blocks
        @user_reports << block.block_number
      end
      @report_photos = Report.where(:block_number => @user_reports)
      @report_photos = @report_photos.where("image_subject is NOT NULL and image_subject != ''").paginate(:page => params[:report_photo_page], :per_page => 5)
    else
      @photos = Photo.all
      @photos = Photo.paginate(:page => params[:photo_page], :per_page => 5)
      @report_photos = Report.where("image_subject is NOT NULL and image_subject != ''").paginate(:page => params[:report_photo_page], :per_page => 5)
    end
  end


  def recentactivity
    @photos = Photo.all(:order => "date DESC", :limit => 5)
  end


  # GET /photos/1
  # GET /photos/1.json
  def show

  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = current_user.photos.build(photo_params)
    @photo.block_number =
    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @photo }
      else
        format.html { render action: 'new' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:comment, :date, :image_subject, :image, :block_number)
    end
end
