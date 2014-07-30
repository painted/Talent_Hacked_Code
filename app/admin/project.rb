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
  
  permit_params :name, :deadline, :client_id, :budget, :projectIndustry, :description, :verified, :status, :skill_list

  config.sort_order = "id_asc"

   index do
    selectable_column
    id_column
    column :name
    column "Client", sortable: :"client.name" do |project|
      client_id = project.client_id
      client_name = Client.find(client_id).name unless client_id == nil
    end
    column :deadline
    column :budget
    column "Industry", sortable: :projectIndustry
    column :verified
    column :status
    actions
  end

    show do
        attributes_table do
            row :status do |project|
                project.status unless project.status.nil?
            end
            row :skills do |project|
                string = ""
                project.skills.each do |skill|
                  string.concat(skill.name + " ")
                end
                string
            end
        end
        default_main_content
    end

    form do |f|
      f.inputs "Label" do
        f.input :name
        f.input :verified
        f.input :status
        f.input :deadline
        f.input :skill_list
        f.input :description
      end
      f.actions
    end

 end



