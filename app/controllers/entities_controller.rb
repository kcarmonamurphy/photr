class EntitiesController < ApplicationController

  before_action :set_entity, only: [:edit, :update, :show, :destroy]

  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params)
    if @entity.save
      flash[:notice] = "Entity was created successfully"
      redirect_to entity_path(@entity)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @entity.update(entity_params)
      flash[:notice] = "Entity was successfully updated"
      redirect_to entity_path(@entity)
    else
      render :edit
    end
  end

  def index
    @entities = Entity.all
  end

  def destroy
    @entity.destroy
    flash[:notice] = "Entity was deleted succcesfully"
    redirect_to entities_path
  end

  private

  def set_entity
    @entity = Entity.find(params[:id])
  end

  def entity_params
    params.require(:entity).permit(:path, :name)
  end

end