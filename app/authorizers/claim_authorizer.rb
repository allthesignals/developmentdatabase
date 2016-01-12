class ClaimAuthorizer < ApplicationAuthorizer
  def self.creatable_by?(user)
    user.has_role? :verified
  end
end
