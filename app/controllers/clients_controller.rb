class ClientsController < ApplicationController

  def index
    # @clients = Client.all
  end

  # def new
  #   @client = Client.new
  # end

  # def create
  #   @client = Client.new(client_params)
  #   @client.save
  #   redirect_to '/clients'
  # end

  # def edit
  #   @client = Client.find params[:id]
  # end

  # def update
  #   @client = Client.find params[:id]
  #   @client.update client_params
  #   redirect_to "/clients/#{params[:id]}"
  # end

  # def destroy
  #    @client = Client.find params[:id]
  #    @client.destroy
  #    flash[:notice] = "Successfully deleted #{@client.name}"
  #    redirect_to '/clients'  
  # end

  def show
     @client = Client.find params[:id] 
  end

  private
  def client_params
    params[:client].permit(:name, :email, :phone, :website, :industry)
  end
end
