class DashboardsController < ApplicationController

  def show
    @client = current_client
    @developer = current_developer
    # @project = @client.projects
  end
  
end
