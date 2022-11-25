class Admin::ProjectPolicy < Admin::BasePolicy
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
      has_permissions?(user, 'project:create')
    end
  
    def show?
      has_permissions?(user, 'project:show')
    end
  
    def update?
      has_permissions?(user, 'project:update')
    end 

    def edit?
      update?
    end
  
    def destroy?
      has_permissions?(user, 'project:delete')
    end

  end
  