class PackageTypesController < ApplicationController
  # GET /package_types
  # GET /package_types.json
  def index
    @package_types = PackageType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @package_types }
    end
  end

  # GET /package_types/1
  # GET /package_types/1.json
  def show
    @package_type = PackageType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @package_type }
    end
  end

  # GET /package_types/new
  # GET /package_types/new.json
  def new
    @package_type = PackageType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @package_type }
    end
  end

  # GET /package_types/1/edit
  def edit
    @package_type = PackageType.find(params[:id])
  end

  # POST /package_types
  # POST /package_types.json
  def create
    @package_type = PackageType.new(params[:package_type])

    respond_to do |format|
      if @package_type.save
        format.html { redirect_to @package_type, notice: 'Package type was successfully created.' }
        format.json { render json: @package_type, status: :created, location: @package_type }
      else
        format.html { render action: "new" }
        format.json { render json: @package_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /package_types/1
  # PUT /package_types/1.json
  def update
    @package_type = PackageType.find(params[:id])

    respond_to do |format|
      if @package_type.update_attributes(params[:package_type])
        format.html { redirect_to @package_type, notice: 'Package type was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @package_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /package_types/1
  # DELETE /package_types/1.json
  def destroy
    @package_type = PackageType.find(params[:id])
    @package_type.destroy

    respond_to do |format|
      format.html { redirect_to package_types_url }
      format.json { head :ok }
    end
  end
end
