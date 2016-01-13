require 'test_helper'

class EditAuthorizerTest < ActiveSupport::TestCase
  def known_user
    @_normal ||= users(:normal)
    @_normal.add_role :known
    @_normal
  end
  alias_method :user, :known_user

  test 'verified user can approve/reject edits on claimed projects' do
    assert EditAuthorizer.creatable_by? user
  end
end
