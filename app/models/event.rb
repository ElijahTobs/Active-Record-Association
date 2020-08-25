class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', optional: true, dependent: :destroy
  has_many :event_attendees, foreign_key: :event, dependent: :destroy
  has_many :attendees, through: :event_attendees, source: :attendee, dependent: :destroy


  scope :past, -> { where( "date < ?", DateTime.now) }

  scope :upcoming, -> { where( "date > ?", DateTime.now) }


 
end
