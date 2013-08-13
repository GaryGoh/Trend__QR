class SwitchCablesController < ApplicationController
  # GET /switch_cables
  # GET /switch_cables.json

  before_filter :get_switch

  def index
    @switch_cables = @switch.switch_cables

    respond_to do |format|
      format.html # index.html.erb
                  #format.json { render json: @switch_cables }
    end
  end

  # GET /switch_cables/1
  # GET /switch_cables/1.json
  def show
    @switch_cable = @switch.switch_cables.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
                  #format.json { render json: @switch_cable }
    end
  end

  # GET /switch_cables/new
  # GET /switch_cables/new.json
  def new
    @switch = Switch.find (params[:switch_id])
    @switch_cable = @switch.switch_cables.build

    respond_to do |format|
      format.html # new.html.erb
                  #format.json { render json: @switch_cable }
    end
  end

  # GET /switch_cables/1/edit
  def edit
    @switch_cable = @switch.find(params[:id])
  end

  # POST /switch_cables
  # POST /switch_cables.json
  def create
    @switch_cable = @switch.switch_cables.build(params[:switch_cable])

    respond_to do |format|
      if @switch_cable.save
        format.html { redirect_to switch_switch_cables_url(@switch), notice: 'Switch cable was successfully created.' }
        #format.json { render json: @switch_cable, status: :created, location: @switch_cable }
      else
        format.html { render action: "new" }
        #format.json { render json: @switch_cable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /switch_cables/1
  # PUT /switch_cables/1.json
  def update
    @switch_cable = @switch.cables.find(params[:id])

    respond_to do |format|
      if @switch_cable.update_attributes(params[:switch_cable])
        format.html { redirect_to switch_switch_cables_url(@switch), notice: 'Switch cable was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        #format.json { render json: @switch_cable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /switch_cables/1
  # DELETE /switch_cables/1.json
  def destroy
    @switch_cable = @switch.switch_cables.find(params[:id])
    @switch_cable.destroy

    respond_to do |format|
      format.html { redirect_to switch_switch_cables_path(@switch) }
      format.json { head :no_content }
    end
  end

  private
  def get_switch
    @switch = Switch.find (params[:switch_id])
  end
end
