class ServertagsController < ApplicationController
  before_action :set_servertag, only: [:show, :edit, :update, :destroy]

  # GET /servertags
  # GET /servertags.json
  def index
    @servertags = Servertag.all
  end

  # GET /servertags/1
  # GET /servertags/1.json
  def show
  end

  # GET /servertags/new
  def new
    @servertag = Servertag.new
  end

  # GET /servertags/1/edit
  def edit
  end

  # POST /servertags
  # POST /servertags.json
  def create
    @servertag = Servertag.new(servertag_params)

    respond_to do |format|
      if @servertag.save
        format.html { redirect_to @servertag, notice: 'Servertag was successfully created.' }
        format.json { render :show, status: :created, location: @servertag }
      else
        format.html { render :new }
        format.json { render json: @servertag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /servertags/1
  # PATCH/PUT /servertags/1.json
  def update
    respond_to do |format|
      if @servertag.update(servertag_params)
        format.html { redirect_to @servertag, notice: 'Servertag was successfully updated.' }
        format.json { render :show, status: :ok, location: @servertag }
      else
        format.html { render :edit }
        format.json { render json: @servertag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servertags/1
  # DELETE /servertags/1.json
  def destroy
    @servertag.destroy
    respond_to do |format|
      format.html { redirect_to servertags_url, notice: 'Servertag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_servertag
      @servertag = Servertag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def servertag_params
      params.require(:servertag).permit(:server_id, :tag_id)
    end
end
