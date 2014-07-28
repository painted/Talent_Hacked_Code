ActiveAdmin.register Developer do

  menu priority: 1
  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
    permit_params :name, :dob, :gender, :email, :phone, :address, :bio, :companyBio, :interests, :skills, :qualifications, :experience, :dayRate, :exInd, :languages, :website, :github, :twitter, :facebook, :linkedinPublicUrl, :avatarUrl, :password, :password_confirmation, :current_password, :industry, :role, :mobile, :contact, :image, :dayrate, :deadline, :projectIndustry, :verified
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
