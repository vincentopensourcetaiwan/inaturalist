class CategoryPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @category = model
  end

  def index?
    (@current_user.has_role? :admin)
  end

  def show?
    (@current_user.has_role? :admin)
  end

  def edit?
    (@current_user.has_role? :admin)
  end

  def update?
    (@current_user.has_role? :admin)
  end

  def new?
    (@current_user.has_role? :admin)
  end

  def create?
    (@current_user.has_role? :admin)
  end

  def destroy?
    (@current_user.has_role? :admin)
  end
end