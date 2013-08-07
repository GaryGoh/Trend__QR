class CablesController < ApplicationController
  # GET /cables
  # GET /cables.json


  before_filter :get_server

  def index
    @cables = @server.cables

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cables }
    end
  end

  # GET /cables/1
  # GET /cables/1.json
  def show
    @cable = @server.cables.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cable }
    end
  end

  # GET /cables/new
  # GET /cables/new.json
  def new
    @server = Server.find (params[:server_id])
    @cable = @server.cables.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cable }
    end
  end

  # GET /cables/1/edit
  def edit
    @cable = @server.cables.find(params[:id])
  end

  # POST /cables
  # POST /cables.json
  def create
    @cable = @server.cables.build(params[:cable])

    respond_to do |format|
      if @cable.save
        format.html { redirect_to (@server), notice: 'Cable was successfully created.' }
        format.json { render json: @cable, status: :created, location: @cable }
      else
        format.html { render action: "new" }
        format.json { render json: @cable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cables/1
  # PUT /cables/1.json
  def update
    @cable = @server.cables.find(params[:id])

    respond_to do |format|
      if @cable.update_attributes(params[:cable])
        format.html { redirect_to server_cables_url(@server), notice: 'Cable was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cables/1
  # DELETE /cables/1.json
  def destroy
    @cable = @server.cables.find(params[:id])
    @cable.destroy

    respond_to do |format|
      format.html { redirect_to @server }
      format.json { head :no_content }
    end
  end


  # To map the specific server to server object
  private
  def get_server
    @server = Server.find (params[:server_id])
  end

end
