class Admins::AdminsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin, only: [:edit, :show, :update, :destroy]
  
  def index
    authorize [:admin, :admin]
    search = params[:search]
    respond_to do |format|
      if search.blank?
        @admins = Admin.paginate(page: params[:page], per_page: 5)
      else
        @admins = Admin.with_name(search).paginate(page: params[:page], per_page: 5)
      end
      format.js
      format.html
    end
  end

  def destroy
    authorize [:admin, :admin]
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_admins_path, notice: 'Admin Deleted Successfully' }
    end
  end

  def new
    authorize [:admin, :admin]
    @admin = Admin.new
  end

  def edit
    authorize [:admin, :admin]
  end

  def show
    authorize [:admin, :admin]
  end

  def update
    authorize [:admin, :admin]
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to admins_admin_path(@admin), notice: 'Admin Updated Successfully ' }
      else
        format.html { render :edit }
      end
    end
  end

  def create
    authorize [:admin, :admin]
    
    @admin = Admin.new(admin_params)
    respond_to do |format|
      if @admin.save
        AdminMailer.new_user_password(@admin).deliver
        format.html { redirect_to admins_admin_path(@admin), notice: ' Admin Added Successfully ' }
      else
        format.html { render :new }
      end
    end
  end  

  private
  def set_admin
    @admin = Admin.find(params[:id])
  end  
  def admin_params
    params.require(:admin).permit(:first_name, :last_name, :email, :country, :city, :address, :joining_date, :dob, :phone_no, :cnic,:password, :password_confirmation )
  end
end