class NotasAlunoPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    true
  end

  def create?
    if user.role == "Professor" || user.admin == true
      true
    else
      false
    end
  end

  def update?
    user.role = "Professor" || user.role = "Admin"
  end
end
