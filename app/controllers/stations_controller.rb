class StationsController < ApplicationController
  
  http_basic_authenticate_with name: "admin", password: "pass", except: [:index, :show]

  def index
  	@stations = Station.all

  	respond_to do |format|
  		format.html # index.html.erb
  		format.json { render :json => @stations }
  		format.xml  { render :xml  => @stations }
  	end

  end

  def new
  	@station = Station.new
  end

	def create
	  @station = Station.new(params[:station].permit(:name, :code, :status))
	 
	  if @station.save
	    redirect_to @station
	  else
	    render 'new'
	  end
	end

	def show
	  @station = Station.find(params[:id])
	end

	def edit
	  @station = Station.find(params[:id])
	end

	def update
	  @station = Station.find(params[:id])
	 
	  if @station.update(params[:station].permit(:name, :code))
	    redirect_to @station
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @station = Station.find(params[:id])
	  @station.destroy
	 
	  redirect_to stations_path
	end
	 
	private
	  def post_params
	    params.require(:station).permit(:name)
	  end

	

end
