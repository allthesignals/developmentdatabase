class DevelopmentTeamMembership < ActiveRecord::Base
  extend Enumerize

  belongs_to :development
  belongs_to :organization

  validates :development,  presence: true
  validates :organization, presence: true

  ROLES = { developer: 1, architect: 2, engineer: 3, contractor: 4,
            landlord:  5, owner:     6, designer: 7 }

  enumerize :role, :in => ROLES, predicates: true

end