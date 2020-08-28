class Event < ApplicationRecord
  validates :title, length: { in: 10..30 }

  belongs_to :creator, class_name: 'User', optional: true
  has_many :event_attendees, foreign_key: :event, dependent: :destroy
  has_many :attendees, through: :event_attendees, source: :attendee, dependent: :destroy

  scope :past, -> { where('date < ?', DateTime.now) }
  scope :upcoming, -> { where('date > ?', DateTime.now) }
end
