class DashboardsController < ApplicationController

  def show
    @client = current_client
    # @project = @client.projects
  end
  
end
