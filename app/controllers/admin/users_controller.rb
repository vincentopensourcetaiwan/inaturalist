class Admin::UsersController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :send_confirmation_instructions, :confirm]
  after_action :verify_authorized

  def index
    authorize User
    @users = User.all.order(id: :desc).page params[:page]
  end

  def show
    @books = @user.books.paginate(page: params[:page], per_page: RECORD_PER_PAGE)
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to admin_users_path, notice: "User updated."
  end

  def send_confirmation_instructions
    @user.send_confirmation_instructions
    redirect_to admin_users_path, notice: "send_confirmation_instructions"
  end

  def confirm
    @user.confirm
    redirect_to admin_users_path, notice: "the user is confirmed"
  end

  private

  def set_user
    if params[:user_id].nil?
      @user = User.friendly.find(params[:id])
    else
      @user = User.friendly.find(params[:user_id])
    end
    authorize @user
  end

  def user_params
    params.require(:user).permit(:tag_tokens, role_ids: [])
  end
end
