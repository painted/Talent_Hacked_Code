ActiveAdmin.register AdminUser do

  controller do

    def show
      @page_title = "Admin Details"
    end

    def edit
      @page_title = "Edit Admin"
    end
  end

  menu priority: 4, label: "Admins"

  permit_params :name, :email, :password, :password_confirmation

  config.sort_order = "id_asc"

  index :title => "Admins" do
    selectable_column
    id_column
    column :name
    column :email
    actions
  end

  filter :name
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end


