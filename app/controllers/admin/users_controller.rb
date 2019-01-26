class Admin::UsersController < ApplicationController
  include Pundit
  layout "admin"
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :send_confirmation_instructions, :confirm]
  after_action :verify_authorized

  def index
    authorize User
    @users = User.all.order(id: :desc).page params[:page]
  end

end
