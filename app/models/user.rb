class User < ApplicationRecord
  has_many :tickets, foreign_key: :event_atendee
  has_many :attended_events, through: :tickets
  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'

  validates :name, presence: true, uniqueness: true
end
