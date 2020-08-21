class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :attended_events, foreign_key: 'attendee_id', class_name: 'Event'
end
