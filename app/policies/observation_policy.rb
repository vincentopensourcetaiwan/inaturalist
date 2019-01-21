class ObservationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @observation = model
  end

  def index?
    @current_user.has_role? :admin
  end

  def show?
    @current_user.has_role? :admin
  end

  def edit?
    @current_user.has_role? :admin or @current_user == @user
  end

  def update?
    @current_user.has_role? :admin or @current_user == @user
  end

  def send_confirmation_instructions?
    @current_user.has_role? :admin
  end

  def confirm?
    @current_user.has_role? :admin
  end
end