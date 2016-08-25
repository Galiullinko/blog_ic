class CommentPolicy < ApplicationPolicy
  def edit?
    owner?
  end

  def destroy?
    owner?
  end

  def create?
    user.present?
  end

  private

  def owner?
    user.present? && record.user == user
  end
end
