class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :hash_email

  has_many :memberships
  has_many :organizations, through: :memberships

  validates :first_name, presence: true
  validates :last_name,  presence: true

  def self.null
    @null ||= new(email: "<Null User>")
  end

  def active_memberships
    memberships.select(&:active?)
  end

  def member_of?(*organizations)
    organizations = Array(organizations).flatten
    joined_orgs = active_memberships.map(&:organization)
    member_of = organizations.select{|org| joined_orgs.include?(org)}
    member_of.empty? ? false : member_of
  end

  def avatar
    user = %w(mark lena lindsay molly eve).sample
    "http://semantic-ui.com/images/avatar2/small/#{user}.png"
  end

  def contributions
    Edit.where(editor_id: id, state: "applied")
  end

  private

    def hash_email
      self.hashed_email = Digest::MD5::hexdigest(email.downcase)
    end
end
