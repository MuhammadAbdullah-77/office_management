class ApplicationController < ActionController::Base
    before_action :authenticate_admin!
    before_action :cache_permissions, if: :admin_signed_in?

    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :invalid_access

    def pundit_user
      current_admin
    end
     
    protected

    def cache_permissions
      Rails.cache.fetch("permission#{current_admin.id}") do  
        current_admin.role.permissions.where(value: true).pluck(:name)
      end
    end

    def invalid_access
      flash[:alert] = "You are not authorized for this action"
      redirect_to(request.referrer || root_path)
    end

    
    def layout_by_resource

        if current_admin.present?
          'application'
        else
          'devise'
        end
    end
end
