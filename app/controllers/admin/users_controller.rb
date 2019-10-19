class Admin::UsersController < ApplicationController
  include Pundit
  layout "admin"
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]
  after_action :verify_authorized

  def index
    authorize User
    @users = User.all
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to admin_users_path, notice: "User updated."
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:inaturalist_login, :inaturalist_id, :nickname, role_ids: [])
  end

end
