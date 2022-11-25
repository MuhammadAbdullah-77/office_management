class Admin::AdminPolicy < Admin::BasePolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    show?
  end

  def new?
    create?
  end

  def create?
    has_permissions?(user, 'admin:create')
  end

  def show?
    has_permissions?(user, 'admin:show')
  end

  def update?
    has_permissions?(user, 'admin:update')
  end

  def edit?
    update?
  end

  def destroy?
    has_permissions?(user, 'admin:delete')
  end

end