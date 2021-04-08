class AddForeighKeyToAtendeeAndAttendedEvent < ActiveRecord::Migration[6.1]
  def change
    add_reference :tickets, :event_atendee, references: :user
    add_reference :tickets, :attended_event, references: :event
  end
end
