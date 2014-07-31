ActiveAdmin.register Developer do

  controller do
    def show
      @page_title = "Developer Details"
    end
    
    def edit
      @page_title = "Edit Developer"
    end
  end

  config.sort_order = "id_asc"

  menu priority: 1

  permit_params :name, :dob, :gender, :email, :phone, :address, :bio, :companyBio, :interests, :skills, :qualifications, :experience, :dayRate, :exInd, :languages, :website, :github, :twitter, :facebook, :linkedinPublicUrl, :avatarUrl, :password, :password_confirmation, :current_password, :industry, :role, :mobile, :contact, :image, :dayrate, :deadline, :projectIndustry, :verified

  index do
      selectable_column
      id_column
      column :name
      column :phone
      column :email
      column :dayrate
      column :address
      column :website
      column :verified
      actions
  end

end
