class Admin::HolidayPolicy < Admin::BasePolicy
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
        has_permissions?(user, 'holiday:create')
      end
    
      def show?
        has_permissions?(user, 'holiday:show')
      end

      def update?
        has_permissions?(user, 'holiday:update')
      end 
  
      def edit?
        update?
      end

      def destroy?
        has_permissions?(user, 'holiday:delete')
      end
    
  end
  