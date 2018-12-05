class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :destroy]

  def index
    @departments = Department.all
  end

  def show
  end

  def new
    @department = Department.new
    # render partial: "form"
  end

  def create
    @department = Department.create(department_params)
    if @department.save 
      redirect_to root_path
    else
      render :new
    end 
  end

  def destroy
    @department.destroy
    redirect_to root_path
  end 

  private 
  def department_params
    params.require(:department).permit(:name)
  end 

  def set_department
    @department = Department.find(params[:id])
  end 
  
end