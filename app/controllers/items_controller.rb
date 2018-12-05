class ItemsController < ApplicationController
  before_action :set_department
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = @department.items.all
  end

  def show
  end

  def new
    @item = @department.items.new
  end

  def create
    @item = @department.items.new(item_params)
    if @item.save
      redirect_to department_item_path
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @item = @department.items.find(params[:id])
    @item.destroy
    redirect_to department_items_path
  end

  private
    def item_params
      params.require(:item).permit(:name, :department_id)
    end
    
    def set_department
      @department = Department.find(params[:department_id])
    end 

    def set_item
      @item = Item.find(params[:id])
    end

end
