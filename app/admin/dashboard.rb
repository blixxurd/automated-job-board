ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    columns do

      column do
        panel "Recent Job Listings" do
          ul do
            JobListing.where(active: true).limit(5).map do |listing|
              li link_to(listing.job_title, admin_job_listing_path(listing))
            end
          end
        end
      end

    end
  end # content

end
