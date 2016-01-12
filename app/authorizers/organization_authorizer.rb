class OrganizationAuthorizer < ApplicationAuthorizer

  def self.creatable_by?(user)
    user.present?
  end

  def self.readable_by?(user)
    true
  end

  def updatable_by?(user)
  end

  def deletable_by?(user)
  end

end
