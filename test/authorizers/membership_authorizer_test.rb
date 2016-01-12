require 'test_helper'

class MembershipAuthorizerTest < ActiveSupport::TestCase

  def normal_user
    @_normal ||= users(:normal)
  end
  alias_method :user, :normal_user

  def organization
    @_org ||= organizations(:mapc)
  end
  alias_method :org, :organization

  def membership
    @_membership ||= memberships(:one)
  end

  def admin_user
    @_admin ||= users(:admin)
    @_admin.add_role(:admin, organization)
    @_admin
  end

  test 'known users can create memberships' do
    assert MembershipAuthorizer.creatable_by? user
  end

  test 'organization admins can update memberships' do
    assert membership.authorizer.updatable_by? admin_user
  end

  test 'users can update their membership but not others' do
    assert membership.authorizer.updatable_by? user
    refute membership.authorizer.updatable_by? users(:tim)
  end
end
