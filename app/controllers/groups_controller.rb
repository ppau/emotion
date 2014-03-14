class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @group.save
      redirect_to groups_url, notice: 'Group was successfully created.'
    else
      render action: 'new', alert: 'Group could not be created.'
    end
  end

  def update
    if @group.update(group_params)
      redirect_to edit_group_url(@group), notice: 'Group was successfully updated.'
    else
      render action: 'edit', alert: 'Group could not be updated.'
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_url, notice: 'Group was successfully destroyed.'
  end

  private

  def set_group
    @group = Group.find_by_uuid!(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :quorum_percentage, user_ids: [])
  end
end
