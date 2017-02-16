class ContainersController < ApplicationController

  #workaround to use NO AUTHENTICATION - UNSAFE
  skip_before_filter :verify_authenticity_token

  #change to docker-ip:remote-docker-api-port
  #Docker.url = 'tcp://192.168.1.243:4243';
  #Docker.url = 'tcp://192.168.1.142:4243';

  before_action :set_container, only: [:show, :edit, :update, :destroy, :start, :stop, :pause, :unpause]
  

  # GET /containers
  # GET /containers.json
  def index
    @containers = Container.all
    @servers = Servers.all
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

  #Docker::Error::ClientError => No command specified
  #Docker::Error::NotFoundError => No such image

  def create
    begin
      #get the server chosen container_params[:server_name]
      @currentServer = Server.where(name: container_params[:server_name])
      Docker.url = 'tcp://' + @currentServer[0]["ip"] + ":" + @currentServer[0]["port"]

      #create memes
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

      Docker.url = ''

      respond_to do |format|
        if @container.save

          format.html { redirect_to root_path, notice: 'Container was successfully created.' }
          format.json { render :show, status: :created, location: @container }
        else
          format.html { render :new }
          format.json { render json: @container.errors, status: :unprocessable_entity }
        end
      end

    rescue Docker::Error::ClientError => e
      respond_to do |format| 
        format.html { redirect_to root_path, notice: "Oops: #{e.message}" }
      end

    rescue Docker::Error::NotFoundError => e
      respond_to do |format| 
        format.html { redirect_to root_path, notice: "Oops: #{e.message}" }
      end

    rescue Docker::Error::ConflictError => e
      respond_to do |format| 
        format.html { redirect_to root_path, notice: "Oops: #{e.message}" }
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
    begin
     Docker::Container.get(Container.find(params[:id]).container_id).remove;
      @container.destroy
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'deleted.' }
        format.json { head :no_content }
      end

    rescue Docker::Error::ConflictError => e
      respond_to do |format| 
        format.html { redirect_to root_path, notice: "Oops: You cannot remove a running container. Stop the container before attempting removal" }
      end
    end
  end

  def start
    Docker::Container.get(Container.find(params[:id]).container_id).start;
    @container.update(:status => 'running')
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Container was started.' }
    end

  end

  def stop
    Docker::Container.get(Container.find(params[:id]).container_id).stop;
    @container.update(:status => 'exited')
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Container was stopped.' }
    end
  end

  def pause
    Docker::Container.get(Container.find(params[:id]).container_id).pause;
    @container.update(:status => 'paused')
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Container was paused.' }
    end
  end

  def unpause
    Docker::Container.get(Container.find(params[:id]).container_id).unpause;
    @container.update(:status => 'running')
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Container was unpaused.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_container
      @container = Container.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def container_params
      params.require(:container).permit(:name, :image, :command, :exposed_port, :host_port, :server_name)
    end
  end
