ActiveAdmin.register Project do

  controller do
    def show
      @page_title = "Project Details"
    end
    
    def edit
      @page_title = "Edit Project"
    end
  end

  menu priority: 3
  
  permit_params :name, :deadline, :client_id, :budget, :projectIndustry, :description, :verified
 
  config.sort_order = "id_asc"

   index do
    selectable_column
    id_column
    column :name
    column "Client", sortable: :"client.name" do |project|
      client_id = project.client_id
      client_name = Client.find(client_id).name
    end
    column :deadline
    column :budget
    column "Industry", sortable: :projectIndustry
    column :verified
    actions
  end

end




