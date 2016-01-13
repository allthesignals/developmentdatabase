require 'test_helper'

class ClaimAuthorizerTest < ActiveSupport::TestCase
  def known_user
    @_normal ||= users(:normal)
    @_normal.add_role :known_user
    @_normal
  end
  alias_method :user, :known_user

  test 'known user can claim development' do
    assert ClaimAuthorizer.creatable_by? known_user
  end
end
