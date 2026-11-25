class InventoriesController < ApplicationController
  before_action :set_inventory, only: %i[ show edit update destroy ]
  before_action :check_user_status, except: %i[ index show ]
  
  def index
    @latest_inventories = Inventory.icludes(:creator, :category).latest
    @top5_inventories = Inventory.includes(:creator, :category).top_5_items
  end

  
  def show
  end

  
  def new
    @inventory = Inventory.new
  end

 
  def edit
  end

  
  def create
    @inventory = current_user.inventories.build(inventory_params)
    if @inventory.save
      redirect_to root_path
    else
      render :new, alert: "You need to sign in first."
    end
  end

  
  def update
    redirect_to root_path @inventory.update(inventory_params) if @inventory.creator == current_user 
    render :edit, status: :unprocessable_entity
  end

  def destroy
    @inventory.destroy if @inventory.creator == current_user
    redirect_to events_path, notice: "Inventory was successfully deleted"
  end

  private
    
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    def inventory_params
      params.expect(:inventory, [:title, :description, :creator_id, :category_id, :is_public, :lock_version])
    end
end
