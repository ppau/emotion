class UsersController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def edit
  end

  def create
    if @user.save
      redirect_to users_url, notice: 'User was successfully created.'
    else
      render action: 'new', alert: 'User could not be created.'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to edit_user_url(@user), notice: 'User was successfully updated.'
    else
      render action: 'edit', alert: 'User could not be updated.'
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  def user_params
    if params[:user] and params[:user][:password].blank?
      params[:user].delete(:password)
    end
    params.require(:user).permit(:name, :role, :email, :password, group_ids: [])
  end
end
