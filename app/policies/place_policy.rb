class PlacePolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @place = model
  end

  def index?
    (@current_user.has_role? :admin) | (@current_user.has_role? :editor)
  end

  def show?
    (@current_user.has_role? :admin) | (@current_user.has_role? :editor)
  end

  def edit?
    (@current_user.has_role? :admin) | (@current_user.has_role? :editor)
  end

  def update?
    (@current_user.has_role? :admin) | (@current_user.has_role? :editor)
  end

  def new?
    (@current_user.has_role? :admin) | (@current_user.has_role? :editor)
  end

  def create?
    (@current_user.has_role? :admin) | (@current_user.has_role? :editor)
  end

  def destroy?
    (@current_user.has_role? :admin) | (@current_user.has_role? :editor)
  end

  def search?
    (@current_user.has_role? :admin) | (@current_user.has_role? :editor)
  end
end