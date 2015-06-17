class CommentPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def new?
    create?
  end

  def show?
    true
  end
end