class ContainertagsController < ApplicationController
  before_action :set_containertag, only: [:show, :edit, :update, :destroy]

  # GET /containertags
  # GET /containertags.json
  def index
    @containertags = Containertag.all
  end

  # GET /containertags/1
  # GET /containertags/1.json
  def show
  end

  # GET /containertags/new
  def new
    @containertag = Containertag.new
  end

  # GET /containertags/1/edit
  def edit
  end

  # POST /containertags
  # POST /containertags.json
  def create
    @containertag = Containertag.new(containertag_params)

    respond_to do |format|
      if @containertag.save
        format.html { redirect_to @containertag, notice: 'Containertag was successfully created.' }
        format.json { render :show, status: :created, location: @containertag }
      else
        format.html { render :new }
        format.json { render json: @containertag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /containertags/1
  # PATCH/PUT /containertags/1.json
  def update
    respond_to do |format|
      if @containertag.update(containertag_params)
        format.html { redirect_to @containertag, notice: 'Containertag was successfully updated.' }
        format.json { render :show, status: :ok, location: @containertag }
      else
        format.html { render :edit }
        format.json { render json: @containertag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /containertags/1
  # DELETE /containertags/1.json
  def destroy
    @containertag.destroy
    respond_to do |format|
      format.html { redirect_to containertags_url, notice: 'Containertag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_containertag
      @containertag = Containertag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def containertag_params
      params.require(:containertag).permit(:container_id, :tag_id)
    end
end
