class Admins::AttendancesController < ApplicationController
    before_action :set_attendance, only: [:destroy, :edit, :update]
    
    def index
        authorize [:admin, :attendance]
        @attendance = Attendance.all
    end
  
    def new
        @attendance = Attendance.new      
    end
  
    def create
      authorize [:admin, :attendance]
      @admin = current_admin
      @attendance = @admin.attendances.new(attendance_params)
      respond_to do |format|
        if @attendance.save
          format.html { redirect_to admins_attendances_path, notice: "Attendance Added Successfully" }
        else
          format.html { render :new }
        end
      end
    end

    def edit
      authorize [:admin, :attendance]
   end
 
   def update
     authorize [:admin, :attendance]
     respond_to do |format|
       if @attendance.update(attendance_params)
         format.html { redirect_to admins_attendances_path(@attendance), notice: "Attendance Updated Successfully" }
       else
         format.html { render :edit }
       end
     end
   end

 
   def destroy
       authorize [:admin, :attendance]
       @attendance.destroy 
        respond_to do |format|
       format.html { redirect_to admins_attendances_path, notice: "Attendance Deleted Successfully " }
     end
   end

   private   

    def set_attendance
        @attendance = Attendance.find(params[:id])
    end


    def attendance_params
        params.require(:attendance).permit(:date, :time, :admin_id, :check_in)
    end
  end