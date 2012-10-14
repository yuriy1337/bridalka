class ContactRequestsController < ApplicationController
  # GET /contact_requests
  # GET /contact_requests.json
  def index
    @contact_requests = ContactRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contact_requests }
    end
  end

  # GET /contact_requests/1
  # GET /contact_requests/1.json
  def show
    @contact_request = ContactRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact_request }
    end
  end

  # GET /contact_requests/new
  # GET /contact_requests/new.json
  def new
    @contact_request = ContactRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact_request }
    end
  end

  # GET /contact_requests/1/edit
  def edit
    @contact_request = ContactRequest.find(params[:id])
  end

  # POST /contact_requests
  # POST /contact_requests.json
  def create
    @contact_request = ContactRequest.new(params[:contact_request])

    respond_to do |format|
      if @contact_request.save
        ContactRequestMailer.contact_request_submitted(@contact_request).deliver
        format.html { redirect_to new_contact_request_path, notice: 'Contact request was successfully submitted.' }
        format.json { render json: @contact_request, status: :created, location: @contact_request }
      else
        format.html { render action: "new" }
        format.json { render json: @contact_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contact_requests/1
  # PUT /contact_requests/1.json
  def update
    @contact_request = ContactRequest.find(params[:id])

    respond_to do |format|
      if @contact_request.update_attributes(params[:contact_request])
        format.html { redirect_to @contact_request, notice: 'Contact request was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_requests/1
  # DELETE /contact_requests/1.json
  def destroy
    @contact_request = ContactRequest.find(params[:id])
    @contact_request.destroy

    respond_to do |format|
      format.html { redirect_to contact_requests_url }
      format.json { head :ok }
    end
  end
end
