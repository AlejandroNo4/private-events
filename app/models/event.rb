class Event < ApplicationRecord
  has_many :tickets, foreign_key: :attended_event_id
  has_many :atendees, through: :tickets, source: :event_atendee
  belongs_to :creator, class_name: 'User'

  validates :creator_id, :date, :title, :description, presence: true

  scope :past, -> { where('date < ?', Time.now) }
  scope :upcoming, -> { where('date > ?', Time.now) }
end
