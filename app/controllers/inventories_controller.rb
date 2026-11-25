class InventoriesController < ApplicationController
  before_action :set_inventory, only: %i[ show edit update destroy ]

  
  def index
    @latest_inventories = In
  end

  
  def show
  end

  
  def new
    @inventory = Inventory.new
  end

 
  def edit
  end

  
  def create
  end

  
  def update
  end

  def destroy
  end

  private
    
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    def inventory_params
      params.expect(:inventory, [:title, :description, :creator_id, :category_id, :is_public, :lock_version])
    end
end
