class ObservationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @observation = model
  end

  def index?
    (@current_user.has_role? :admin) | (@current_user.has_role? :editor) | (@current_user.has_role? :contributor)
  end

  def edit?
    (@current_user.has_role? :admin) | (@current_user.has_role? :editor)
  end

  def update?
    (@current_user.has_role? :admin) | (@current_user.has_role? :editor)
  end


end