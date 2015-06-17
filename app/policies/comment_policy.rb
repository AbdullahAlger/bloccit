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

  def destory?
    user.present? && (record.user == user || user.admin? || user.moderator?)
  end
end