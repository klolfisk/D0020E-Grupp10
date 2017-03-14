class ContainersController < ApplicationController

  #workaround to use NO AUTHENTICATION - UNSAFE
  skip_before_filter :verify_authenticity_token

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
    begin
      #get the server chosen container_params[:server_id]
      @currentServer = Server.where(id: container_params[:server_id])
      Docker.url = 'tcp://' + @currentServer[0].ip + ":" + @currentServer[0].port

      #create the container in docker
      if container_params[:exposed_port].blank?
        @con = Docker::Container.create(
        'name' => container_params[:name],
        'Image' => container_params[:image]
        )      
      else 
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
      end

      #adds the container into the database
      @container = Container.new(:name => container_params[:name], :image => container_params[:image], :command => container_params[:command], :exposed_port => container_params[:exposed_port], 
        :host_port => container_params[:host_port], :dockercontainer_id => @con.id, :status => 'Created')

      Docker.url = ''

      respond_to do |format|
        if @container.save
          Serverhascontainer.new(:server_id => @currentServer[0].id, :container_id => @container.id).save
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
      #finds the current server that the container is on and sets it as Docker.ulr
      #@serverid = Serverhascontainer.where(container_id: @container.id)[0].server_id;
      #@currentServer = Server.where(id: @serverid)
      #Docker.url = 'tcp://' + @currentServer[0]["ip"] + ":" + @currentServer[0]["port"]
      Docker.url = findServer()

      #removes the container from docker
      Docker::Container.get(Container.find(params[:id]).dockercontainer_id).remove;

      #removes the Server-container relation from the database
      @d = Serverhascontainer.where(container_id: @container.id)        
      Serverhascontainer.destroy(@d[0].id);

      #removes the container from the database
      @container.destroy
      Docker.url = ''
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
    #@serverid = Serverhascontainer.where(container_id: @container.id)[0].server_id;
    #@currentServer = Server.where(id: @serverid)
    #Docker.url = 'tcp://' + @currentServer[0]["ip"] + ":" + @currentServer[0]["port"]
    Docker.url = findServer()

    Docker::Container.get(Container.find(params[:id]).dockercontainer_id).start;
    @container.update(:status => 'running')
    Docker.url = ''
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Container was started.' }
    end

  end

  def stop
    #@serverid = Serverhascontainer.where(container_id: @container.id)[0].server_id;
    #@currentServer = Server.where(id: @serverid)
    #Docker.url = 'tcp://' + @currentServer[0]["ip"] + ":" + @currentServer[0]["port"]
    Docker.url = findServer()
    Docker::Container.get(Container.find(params[:id]).dockercontainer_id).stop;
    @container.update(:status => 'exited')
    Docker.url = ''
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Container was stopped.' }
    end
  end

  def pause
    #@serverid = Serverhascontainer.where(container_id: @container.id)[0].server_id;
    #@currentServer = Server.where(id: @serverid)
    #Docker.url = 'tcp://' + @currentServer[0]["ip"] + ":" + @currentServer[0]["port"]
    Docker.url = findServer()

    Docker::Container.get(Container.find(params[:id]).dockercontainer_id).pause;
    @container.update(:status => 'paused')
    Docker.url = ''
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Container was paused.' }
    end
  end

  def unpause
    #@serverid = Serverhascontainer.where(container_id: @container.id)[0].server_id;
    #@currentServer = Server.where(id: @serverid)
    #Docker.url = 'tcp://' + @currentServer[0]["ip"] + ":" + @currentServer[0]["port"]
    Docker.url = findServer()
    
    Docker::Container.get(Container.find(params[:id]).dockercontainer_id).unpause;
    @container.update(:status => 'running')
    Docker.url = ''
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Container was unpaused.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_container
      @container = Container.find(params[:id])
    end

    #fungerar inte atm
    def findServer
      @serverid = Serverhascontainer.where(container_id: @container.id)[0].server_id;
      @currentServer = Server.where(id: @serverid)
      @c = 'tcp://' + @currentServer[0]["ip"] + ":" + @currentServer[0]["port"]
      return @c;
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def container_params
      params.require(:container).permit(:name, :image, :command, :exposed_port, :host_port, :server_id)
    end
  end