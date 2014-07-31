ActiveAdmin.register_page "Dashboard" do

    menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

    content title: "Dashboard" do

        config.sort_order = "id_asc"

        columns do
            column do
                panel "Developers" do
                    ul do
                        Developer.all.map do |developer|
                            li link_to(developer.email, admin_developer_path(developer))
                        end
                    end
                end
            end

            column do
                panel "Clients" do
                    ul do
                        Client.all.map do |client|
                            li link_to(client.email, admin_client_path(client))
                        end
                    end
                end
            end

            column do
                panel "Projects" do
                    ul do
                        Project.all.map do |project|
                            li link_to(project.name, admin_project_path(project))
                        end
                    end
                end
            end
       end
 
       section "Recently Updated Projects" do
            table_for PaperTrail::Version.order('id desc').limit(20) do |version|
                column "Id" do |v| link_to v.item.id, [:admin, v.item] end
                column "Project Name" do |v| link_to v.item.name, [:admin, v.item] end
                column "Client" do |v|
                    client_id = v.item.client_id
                    client_name = Client.find(client_id).name unless client_id == nil
                    link_to client_name, [:admin, Client.find(client_id)]
                end
                column "Verified" do |v| v.item.verified ? "Yes" : "No" end
                column "Status" do |v| v.item.status end
                 # column "Type" do |v| v.item_type.underscore.humanize end
                 column "Modified at" do |v| v.created_at.to_s :long end
                 column "Changed by" do |v| 
                    if v.whodunnit != "User"
                        admin_name =  AdminUser.find(v.whodunnit).name
                        if admin_name == ""
                            link_to AdminUser.find(v.whodunnit).email, [:admin, AdminUser.find(v.whodunnit)] 
                        else
                            link_to AdminUser.find(v.whodunnit).name, [:admin, AdminUser.find(v.whodunnit)] 
                        end
                    else
                        v.whodunnit
                    end
                end
            end
        end
    end
end




             # column "Changed by" do |v| 
             #        if admin_user_signed_in?
             #            user =  AdminUser.find(v.whodunnit).name || ""
             #            if user == ""
             #                link_to AdminUser.find(v.whodunnit).email, [:admin, AdminUser.find(v.whodunnit)] 
             #            else
             #                link_to AdminUser.find(v.whodunnit).name, [:admin, AdminUser.find(v.whodunnit)] 
             #            end
             #        elsif current_client
             #            user =  Client.find(v.whodunnit).name || ""
             #            if user == ""
             #                link_to Client.find(v.whodunnit).email, [:admin, Client.find(v.whodunnit)] 
             #            else
             #                link_to Cleint.find(v.whodunnit).name, [:admin, Client.find(v.whodunnit)] 
             #            end
             #        else
             #            user =  Developer.find(v.whodunnit).name || ""
             #            if user == ""
             #                link_to Developer.find(v.whodunnit).email, [:admin, Developer.find(v.whodunnit)] 
             #            else
             #                link_to Developer.find(v.whodunnit).name, [:admin, Developer.find(v.whodunnit)] 
             #            end
             #        end



