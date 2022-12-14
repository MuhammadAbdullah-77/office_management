class Admins::HolidaysController < Admins::BaseController
    before_action :set_holidays, only: [:edit, :update, :destroy, :show]
  
    def index
      authorize [:admin, :holiday]
        search = params[:search]
        respond_to do |format|
          if search.blank?
            @holidays= Holiday.paginate(page: params[:page], per_page: 5)
          else
            @holidays = Holiday.with_date(search).paginate(page: params[:page], per_page: 5)
          end
          format.js
          format.html
        end
    end
  
    def new
        authorize [:admin, :holiday]
        @holidays = Holiday.new
    end
  
    def create
      authorize [:admin, :holiday]
      @admin = current_admin
      @holidays = @admin.holidays.new(holidays_params)
      respond_to do |format|
        if @holidays.save
          format.html { redirect_to admins_holidays_path, notice: "Leaves Applied Successfully " }
        else
          format.html { render :new }
        end
      end
    end
  
    def edit
      authorize [:admin, :holiday]
    end

    def show
      authorize [:admin, :holiday]
    end
  
    def update
      authorize [:admin, :holiday]
      respond_to do |format|
        if @holidays.update(holidays_params)
          format.html { redirect_to admins_holidays_path, notice: "Leaves Updated Successfully" }
        else
          format.html { render :edit }
        end
      end
    end
  
    def destroy
      authorize [:admin, :holiday]
        @holidays.destroy 
         respond_to do |format|
        format.html { redirect_to admins_holidays_path, notice: "Leaves Deleted Successfully " }
      end
    end
  

    private
  
    def set_holidays
      @holidays = Holiday.find(params[:id])
    end
  
    def holidays_params
      params.require(:holiday).permit(:reason, :start_date, :end_date, :admin_id, :status)
    end
  end
  
  