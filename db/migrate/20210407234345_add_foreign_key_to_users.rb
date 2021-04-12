class AddForeignKeyToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :creator, references: :user
  end
end
