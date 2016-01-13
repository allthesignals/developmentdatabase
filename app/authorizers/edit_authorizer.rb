class EditAuthorizer < ApplicationAuthorizer
  def self.creatable_by?(user)
    user.has_role? :known
  end
end
