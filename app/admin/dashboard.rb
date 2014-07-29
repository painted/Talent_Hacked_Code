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
    end
end
