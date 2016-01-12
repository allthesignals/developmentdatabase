require 'test_helper'

class OrganizationAuthorizerTest < ActiveSupport::TestCase

  def normal_user
    @_normal ||= users(:normal)
  end
  alias_method :user, :normal_user

  def organization
    @_org ||= organizations(:mapc)
  end
  alias_method :org, :organization

  def admin_user
    @_admin ||= users(:admin)
    @_admin.add_role(:admin, organization)
    @_admin
  end

  test 'known users can create organizations' do
    assert OrganizationAuthorizer.creatable_by?(user)
  end

  test 'anyone can view organizations' do
    assert OrganizationAuthorizer.readable_by?(user)
  end

  test 'only admins can update organizations' do
    refute org.authorizer.updatable_by?(user)
    assert org.authorizer.updatable_by?(admin_user)
  end

  test 'no one can delete organizations' do
    refute org.authorizer.deletable_by?(user)
    refute org.authorizer.deletable_by?(admin_user)
  end
end
