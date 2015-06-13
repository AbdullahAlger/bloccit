class PostPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      if  user.present? && (user.admin? || user.moderator?)
        scope.all
      else
        scope.where(:user => user) # using just id doesn't work. Had to use user_id.
      end
    end
   end

  def index?
    true
  end

end