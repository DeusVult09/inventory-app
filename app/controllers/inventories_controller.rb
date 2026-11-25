class InventoriesController < ApplicationController
  before_action :set_inventory, only: %i[ show edit update destroy ]
  before_action :require_login, except: %i[ index show ]
  before_action :authorize_user, only: %i[edit update destroy]

  def index
    @latest_inventories = Inventory.includes(:creator, :category).latest
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
      redirect_to @inventory, notice: "New inventory was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  
  def update
    redirect_to root_path @inventory.update(inventory_params) 
    render :edit, status: :unprocessable_entity
  end

  def destroy
    @inventory.destroy
    redirect_to events_path, notice: "Inventory was successfully deleted"
  end

  private

    def authorize_user
      head :forbidden unless @inventory.creator == current_user
    end
    
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    def inventory_params
      params.expect(:inventory, [:title, :description, :creator_id, :category_id, :is_public, :lock_version])
    end
end
