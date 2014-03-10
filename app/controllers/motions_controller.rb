class MotionsController < ApplicationController
  before_action :set_group
  before_action :set_motion, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource through: :group

  def index
    @motions = @group.motions
  end

  def show
  end

  def new
    @motion = @group.motions.new
  end

  def edit
  end

  def create
    @motion = @group.motions.new(motion_params)
    if @motion.save
      redirect_to [@group, @motion], notice: 'Motion was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @motion.update(motion_params)
      redirect_to [@group, @motion], notice: 'Motion was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @motion.destroy
    redirect_to group_url(@group), notice: 'Motion was successfully destroyed.'
  end

  private

  def set_group
    @group = current_user.groups.find_by_uuid!(params[:group_id])
  end

  def set_motion
    @motion = @group.motions.find(params[:id])
  end

  def motion_params
    params.require(:motion).permit(:name, :text).merge(user_id: current_user.id)
  end
end
