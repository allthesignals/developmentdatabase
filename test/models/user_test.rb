require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def user
    @user ||= users :normal
  end

  test "requires a first name" do
    user.first_name = nil
    assert_not user.valid?
  end

  test "requires a last name" do
    user.last_name = nil
    assert_not user.valid?
  end

  test "hasherize email" do
    user.save
    assert_not_empty user.hashed_email
  end

  test "#member_of? for single organization" do
    org = organizations(:mapc)
    refute user.member_of?(org)
    user.memberships.build(organization: org)
    refute user.member_of?(org)
    user.memberships.first.activated
    assert user.member_of?(org)
  end

  test "#member_of? for multiple organization" do
    org = organizations(:mapc)
    org2 = organizations(:massit)
    user.memberships.build(organization: org,  state: :active)
    user.memberships.build(organization: org2, state: :active)
    assert user.member_of?(org, org2)
    assert_equal([org, org2], user.member_of?([org, org2]))
  end
end
