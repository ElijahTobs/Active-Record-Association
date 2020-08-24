class User < ApplicationRecord
  devise :database_authenticatable, :registerable
  
  has_many :event_attendees, foreign_key: 'attendee_id'
  has_many :events, through: :event_attendees, source: :event_id
  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'
end
