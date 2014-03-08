class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params.merge(uuid: SecureRandom.uuid))
    if @group.save
      redirect_to groups_url, notice: 'Group was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @group.update(group_params)
      redirect_to groups_url, notice: 'Group was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /groups/1
  def destroy
    @group.destroy
    redirect_to groups_url, notice: 'Group was successfully destroyed.'
  end

  private

  def set_group
    @group = Group.find_by_uuid!(params[:id])
  end

  def group_params
    params.require(:group).permit(:name)
  end
end
