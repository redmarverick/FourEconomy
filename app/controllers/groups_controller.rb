class GroupsController < ApplicationController
  before_action :set_group, only: [:show]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @header_text = 'CATEGORIES'
    if current_user.admin?
      @groups = Group.all # Admins can see all groups
    else
      @groups = current_user ? current_user.groups : Group.none
    end
  end

  def show
    @group = Group.includes(entities: :user).find(params[:id])
    @header_text = @group.name.upcase
    @entities = @group.entities.order(created_at: :desc)
  end

  def new
    @header_text = 'CREATE CATEGORY'
    @button_text = 'Save'
  end

  def create
    @group = Group.new(group_params)
    @group.creator_id = current_user.id

    if @group.save
      redirect_to groups_path, notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
