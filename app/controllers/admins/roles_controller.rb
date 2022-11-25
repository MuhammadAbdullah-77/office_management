class Admins::RolesController <  Admins::BaseController
    before_action :set_role, only: [:edit, :update, :destroy]
  
    def index
       authorize [:admin, :role]
       @roles = Role.all
    end
  
    def permission_hash(record)
      authorize [:admin, :role]
      record.name.split(':').first
    end
  
    def edit
      authorize [:admin, :role]
      @hash = Hash.new 
      @role.permissions.each  do |permission|
      @hash[permission_hash(permission)] = Array(@hash[permission_hash(permission)]) << permission
      end
    end
  
    def update
      authorize [:admin, :role]
      respond_to do |format|
        if @role.update(roles_params)
          format.html { redirect_to admins_roles_path, notice: "Permissions Updated" }
        else 
          render 'edit'
        end
      end
    end
  
    def destroy
      authorize [:admin, :role]
      @role.destroy
      redirect_to admins_roles_path
    end
  
    private
  
    def set_role
      @role = Role.find(params[:id])
    end
  
    def roles_params
      params.require(:role).permit(:name, permissions_attributes: [:id, :name, :value])
    end
  end
  