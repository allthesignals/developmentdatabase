class MembershipAuthorizer < ApplicationAuthorizer
  def self.creatable_by?(user)
    user.present?
  end

  def updatable_by?(user)
    user.has_role?(:admin, resource.organization) ||
      resource.user == user
  end
end
