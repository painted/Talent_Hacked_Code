class ClientsController < ApplicationController

  def index
  end

  def show
     @client = Client.find params[:id] 
  end

end
