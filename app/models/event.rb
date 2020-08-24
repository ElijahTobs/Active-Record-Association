class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', optional: true
  has_many :event_attendees, foreign_key: :event
  has_many :users, through: :event_attendees, source: :attendee
end
