class Todo < ApplicationRecord

  validates :description, presence: { message: 'is required' }, length: { maximum: 250 }
  validates :completed_at_before_type_cast,
    format: { with: /\A\d+-\d{2}-\d{2}\z/ },
    allow_nil: true

  before_save do
    if completed_changed?
      if completed?
        self.completed_at ||= Time.zone.now
      else
        self.completed_at = nil
      end
    end
  end

end
