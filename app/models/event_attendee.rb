class EventAttendee < ApplicationRecord
  belongs_to :event, class_name: 'Event', optional: true
  belongs_to :attendee, class_name: 'User', optional: true
end
