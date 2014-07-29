class DashboardsController < ApplicationController

  def show
    @client = current_client
  end
  
end
