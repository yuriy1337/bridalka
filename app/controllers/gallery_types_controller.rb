class GalleryTypesController < ApplicationController
  # GET /gallery_types
  # GET /gallery_types.json
  def index
    @gallery_types = GalleryType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gallery_types }
    end
  end

  # GET /gallery_types/1
  # GET /gallery_types/1.json
  def show
    @gallery_type = GalleryType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gallery_type }
    end
  end

  # GET /gallery_types/new
  # GET /gallery_types/new.json
  def new
    @gallery_type = GalleryType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gallery_type }
    end
  end

  # GET /gallery_types/1/edit
  def edit
    @gallery_type = GalleryType.find(params[:id])
  end

  # POST /gallery_types
  # POST /gallery_types.json
  def create
    @gallery_type = GalleryType.new(params[:gallery_type])

    respond_to do |format|
      if @gallery_type.save
        format.html { redirect_to @gallery_type, notice: 'Gallery type was successfully created.' }
        format.json { render json: @gallery_type, status: :created, location: @gallery_type }
      else
        format.html { render action: "new" }
        format.json { render json: @gallery_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gallery_types/1
  # PUT /gallery_types/1.json
  def update
    @gallery_type = GalleryType.find(params[:id])

    respond_to do |format|
      if @gallery_type.update_attributes(params[:gallery_type])
        format.html { redirect_to @gallery_type, notice: 'Gallery type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gallery_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gallery_types/1
  # DELETE /gallery_types/1.json
  def destroy
    @gallery_type = GalleryType.find(params[:id])
    @gallery_type.destroy

    respond_to do |format|
      format.html { redirect_to gallery_types_url }
      format.json { head :no_content }
    end
  end
end
