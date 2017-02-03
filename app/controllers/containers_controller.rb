class ContainersController < ApplicationController
  
  #workaround to use NO AUTHENTICATION - UNSAFE
  skip_before_filter :verify_authenticity_token

  #change to docker-ip:remote-docker-api-port
  #Docker.url = 'tcp://192.168.1.243:4243';
  Docker.url = 'tcp://192.168.1.142:4243';

  before_action :set_container, only: [:show, :edit, :update, :destroy, :start, :stop, :pause, :unpause]

  # GET /containers
  # GET /containers.json
  def index
    @containers = Container.all
  end

  # GET /containers/1
  # GET /containers/1.json
  def show
  end

  # GET /containers/new
  def new
    @container = Container.new
  end

  # GET /containers/1/edit
  def edit
  end

  # POST /containers
  # POST /containers.json
  def create
    @con = Docker::Container.create(
      'name' => container_params[:name],
      'Image' => container_params[:image],
      'ExposedPorts' => { container_params[:exposed_port]+'/tcp' => {} },
      'HostConfig' => {
        'PortBindings' => {
          container_params[:exposed_port]+'/tcp' => [{ 'HostPort' => container_params[:host_port] }]
        }
      }
      )

    @container = Container.new(:name => container_params[:name], :image => container_params[:image], :command => container_params[:command], :exposed_port => container_params[:exposed_port], 
      :host_port => container_params[:host_port], :container_id => @con.id, :status => 'Created')

    respond_to do |format|
      if @container.save

        format.html { redirect_to @container, notice: 'Container was successfully created.' }
        format.json { render :show, status: :created, location: @container }
      else
        format.html { render :new }
        format.json { render json: @container.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /containers/1
  # PATCH/PUT /containers/1.json
  def update
    respond_to do |format|
      if @container.update(container_params)
        format.html { redirect_to @container, notice: 'Container was successfully updated.' }
        format.json { render :show, status: :ok, location: @container }
      else
        format.html { render :edit }
        format.json { render json: @container.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /containers/1
  # DELETE /containers/1.json
  def destroy
    @container.destroy
    respond_to do |format|
      format.html { redirect_to containers_url, notice: 'Container was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def start
    Docker::Container.get(Container.find(params[:id]).container_id).start;
    @container.update(:status => 'running')
    redirect_to :controller => 'home', :action => 'index'
  end

  def stop
    Docker::Container.get(Container.find(params[:id]).container_id).stop;
    @container.update(:status => 'exited')
    redirect_to :controller => 'home', :action => 'index'
  end

  def pause
    Docker::Container.get(Container.find(params[:id]).container_id).pause;
    @container.update(:status => 'paused')
    redirect_to :controller => 'home', :action => 'index'
  end

  def unpause
    Docker::Container.get(Container.find(params[:id]).container_id).unpause;
    @container.update(:status => 'running')
    redirect_to :controller => 'home', :action => 'index'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_container
      @container = Container.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def container_params
      params.require(:container).permit(:name, :image, :command, :exposed_port, :host_port)
    end
  end
