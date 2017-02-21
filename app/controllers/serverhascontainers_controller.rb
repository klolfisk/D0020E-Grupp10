class ServerhascontainersController < ApplicationController
  before_action :set_serverhascontainer, only: [:show, :edit, :update, :destroy]

  # GET /serverhascontainers
  # GET /serverhascontainers.json
  def index
    @serverhascontainers = Serverhascontainer.all
  end

  # GET /serverhascontainers/1
  # GET /serverhascontainers/1.json
  def show
  end

  # GET /serverhascontainers/new
  def new
    @serverhascontainer = Serverhascontainer.new
  end

  # GET /serverhascontainers/1/edit
  def edit
  end

  # POST /serverhascontainers
  # POST /serverhascontainers.json
  def create
    @serverhascontainer = Serverhascontainer.new(serverhascontainer_params)

    respond_to do |format|
      if @serverhascontainer.save
        format.html { redirect_to @serverhascontainer, notice: 'Serverhascontainer was successfully created.' }
        format.json { render :show, status: :created, location: @serverhascontainer }
      else
        format.html { render :new }
        format.json { render json: @serverhascontainer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /serverhascontainers/1
  # PATCH/PUT /serverhascontainers/1.json
  def update
    respond_to do |format|
      if @serverhascontainer.update(serverhascontainer_params)
        format.html { redirect_to @serverhascontainer, notice: 'Serverhascontainer was successfully updated.' }
        format.json { render :show, status: :ok, location: @serverhascontainer }
      else
        format.html { render :edit }
        format.json { render json: @serverhascontainer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /serverhascontainers/1
  # DELETE /serverhascontainers/1.json
  def destroy
    @serverhascontainer.destroy
    respond_to do |format|
      format.html { redirect_to serverhascontainers_url, notice: 'Serverhascontainer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_serverhascontainer
      @serverhascontainer = Serverhascontainer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def serverhascontainer_params
      params.fetch(:serverhascontainer, {})
    end
end
