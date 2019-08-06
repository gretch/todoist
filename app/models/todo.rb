class Todo < ApplicationRecord

  validates :description, presence: { message: 'is required' }, length: { maximum: 250 }
  validates_datetime :completed_at, allow_blank: true
  validate :is_completed_set

  before_save do
    if completed?
      self.completed_at ||= Date.today
    else
      self.completed_at = nil
    end
  end

  private
  def is_completed_set
    if completed_at_changed? && completed_at.present? && !completed?
      errors.add(:completed, "should be true if completed_at is specified")
    end
  end
end
