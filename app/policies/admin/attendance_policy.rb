class Admin::AttendancePolicy < Admin::BasePolicy
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
        has_permissions?(user, 'attendance:create')
      end
    
      def show?
        has_permissions?(user, 'attendance:show')
      end

      def update?
        has_permissions?(user, 'attendance:update')
      end 
  
      def edit?
        update?
      end

      def destroy?
        has_permissions?(user, 'attendance:delete')
      end
    
  end
  