class PostPolicy < ApplicationPolicy

  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user, @scope = user, scope
    end

    def resolve
      if user.admin? || user.moderator?
        scope.all
      else
        scope.where(:user_id => user.id) # using just id doesn't work. Had to use user_id.
      end
    end
   end

  def index?
    true
  end

end