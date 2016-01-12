require 'test_helper'

class ClaimAuthorizerTest < ActiveSupport::TestCase
  def verified_user
    @_normal ||= users(:normal)
    @_normal.add_role :verified
    @_normal
  end
  alias_method :user, :verified_user

  test 'verified user can claim development' do
    assert ClaimAuthorizer.creatable_by? verified_user
  end
end
