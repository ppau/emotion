class VotesController < ApplicationController
  before_action :set_group
  before_action :set_motion
  before_action :set_vote

  def update
    if @vote.update(motion_params)
      redirect_to [@group, @motion], notice: 'Vote successful.'
    else
      redirect_to [@group, @motion], error: "Vote not successful: #{@vote.errors.full_messages.join(', ')}"
    end
  end

  private

  def set_group
    @group = current_user.groups.find_by_uuid!(params[:group_id])
  end

  def set_motion
    @motion = @group.motions.find(params[:motion_id])
  end

  def set_vote
    @vote = @motion.votes.find_by_user_id!(current_user.id)
  end

  def motion_params
    params.permit(:response)
  end
end
