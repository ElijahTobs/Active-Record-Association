class EventAttendee < ApplicationRecord
  belongs_to :event_id, class_name: 'Event'
  belongs_to :attendee_id, class_name: 'User'

  
end
