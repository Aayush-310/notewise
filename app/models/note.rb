class Note < ApplicationRecord
    belongs_to :user
    serialize :tags, Array
    def self.search(query)
        where("title LIKE :query OR body LIKE :query OR tags LIKE :query", query: "%#{query}%")
    end
    def validate_reminder
        if reminder.present? && !reminder.is_a?(ActiveSupport::TimeWithZone)
          errors.add(:reminder, 'must be a valid date and time value')
        end
      end
end
