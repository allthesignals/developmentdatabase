class Edit < ActiveRecord::Base
  extend Enumerize

  has_many :fields, class_name: :EditField, dependent: :nullify

  belongs_to :editor,    class_name: :User
  belongs_to :moderator, class_name: :User
  belongs_to :development

  validates :development, presence: true
  validates :editor, presence: true
  validates :state,  presence: true

  enumerize :state, in: [:pending, :applied, :approved, :declined],
    default: :pending, predicates: true

  def approved(options={})
    self.state = :approved
    apply!(options)
  end

  def declined(options={})
    self.state = :declined
    self.save! if should_save?(options)
  end

  # Alter self.development with contents, and optionally save.
  def apply!(options={})
    return false if unignored_conflict?(options)
    apply(options)
    if should_save?(options)
      transaction do
        self.save!
        development.save!
      end
    end
  end

  def apply(options={})
    applied if development.fields.merge!(assignable_attributes)
  end

  def applied
    self.applied_at = Time.now
    self.state = :applied
  end

  # The edit can be applied if it's not applied and there's no conflict.
  def applyable?
    if applied? || conflict?
      false
    else
      true
    end
  end

  def not_applyable?
    !applyable?
  end

  def conflict
    fields.map(&:conflict).compact
  end

  def conflict?
    conflict.any?
  end

  # Returns a hash that can be used in assign_attributes
  # or update_attributes.
  def assignable_attributes
    names, to_values = fields.pluck(:name), fields.map(&:to)
    Hash[names.zip(to_values)]
  end

  private

    # If there's a conflict, and we aren't explicitly ignoring it.
    def unignored_conflict?(options={})
      ignore_conflict = options.fetch(:ignore_conflict, false)
      do_not_ignore_conflict = !ignore_conflict
      conflict? && do_not_ignore_conflict
    end

    def should_save?(options={})
      options.fetch(:save, true)
    end
end
