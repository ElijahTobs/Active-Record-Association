class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', optional: true, dependent: :destroy
  has_many :event_attendees, foreign_key: :event, dependent: :destroy
  has_many :attendees, through: :event_attendees, source: :attendee, dependent: :destroy

  def self.past
    events = self.all
    html = ""
    events.each do |event|
      html << "<li>#{event.title}</li>" if event.date < DateTime.now
    end
    html.html_safe
  end

  def self.upcoming
    events = self.all
    html = ""
    events.each do |event|
      html << "<li>#{event.title}</li>" if event.date > DateTime.now
    end
    html.html_safe
  end
end
