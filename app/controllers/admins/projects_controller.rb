class Admins::ProjectsController < Admins::BaseController
    before_action :set_project, only: [:edit, :update, :destroy, :show]
  
    def index
        authorize [:admin, :project]
        @projects = Project.all
    end
  
    def new
        authorize [:admin, :project]
        @project = Project.new
         @employee_project = @project.employee_projects.build
        
    end
  
    def create
      authorize [:admin, :project]
      @project = Project.new(project_params)
      respond_to do |format|
        if @project.save
          format.html { redirect_to admins_projects_path, notice: "Project Added Successfully " }
        else
          format.html { render :new }
        end
      end
    end
  
    def show
       authorize [:admin, :project]
    end
  
    def edit
       authorize [:admin, :project]
    end
  
    def update
      authorize [:admin, :project]
      respond_to do |format|
        if @project.update(project_params)
          format.html { redirect_to admins_projects_path(@project), notice: "Project Updated Successfully" }
        else
          format.html { render :edit }
        end
      end
    end

  
    def destroy
        authorize [:admin, :project]
        @project.destroy 
         respond_to do |format|
        format.html { redirect_to admins_projects_path, notice: "Project Deleted Successfully " }
      end
    end
  
    private
  
    def set_project
      @project = Project.find(params[:id])
    end
  
    def project_params
      params.require(:project).permit(:title, :start_date, :end_date, :admin_id, :status, employee_projects_attributes: [:id, :admin_id])
    end
  end
  
  