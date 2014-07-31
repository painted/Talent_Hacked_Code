ActiveAdmin.register Client do

  controller do
    def show
      @page_title = "Client Details"
    end
    
    def edit
      @page_title = "Edit Client"
    end
  end

  config.sort_order = "id_asc"

  menu priority: 2

  permit_params :name, :dob, :gender, :email, :phone, :address, :bio, :companyBio, :interests, :skills, :qualifications, :experience, :dayRate, :exInd, :languages, :website, :github, :twitter, :facebook, :linkedinPublicUrl, :avatarUrl, :password, :password_confirmation, :current_password, :industry, :role, :mobile, :contact, :image, :dayrate, :deadline, :projectIndustry, :verified, :status
  
  index do
      selectable_column
      id_column
      column :name
      column :industry
      column :phone
      column :email
      column :address
      column "#Projects", sortable: :"projects.count" do |client|
          client.projects.count
      end
      column :verified
      actions
  end

end
