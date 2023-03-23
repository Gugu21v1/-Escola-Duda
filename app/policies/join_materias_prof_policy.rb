class JoinMateriasProfPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def create?
<<<<<<< HEAD
    true
=======
    user.admin?
>>>>>>> ec4887144c854fca6fe6aabad422c153578d21b6
  end
end
