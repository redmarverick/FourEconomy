class EntitiesController < ApplicationController
  before_action :set_entity, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  def new
    @entity = Entity.new
    @header_text = 'CREATE TRANSACTION'
    @button_text = 'Save'
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.author_id = current_user.id

    if @entity.save
      @entity.groups.reload
      redirect_to group_path(@entity.groups.first), notice: 'Entity was successfully created.'
    else
      render :new
    end
  end

  private

  def set_entity
    @entity = Entity.find(params[:id])
  end

  def entity_params
    params.require(:entity).permit(:name, :amount, group_ids: [])
  end
end
