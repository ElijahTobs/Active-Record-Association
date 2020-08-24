class EventAttendee < ApplicationRecord
  belongs_to :event, class_name: 'Event', optional: true
  # belongs_to :attendee, class_name: 'User', optional: true
  has_many :attendees, foreign_key: 'id', class_name: 'User'
end
