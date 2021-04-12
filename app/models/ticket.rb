class Ticket < ApplicationRecord
  belongs_to :event_atendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'
end
