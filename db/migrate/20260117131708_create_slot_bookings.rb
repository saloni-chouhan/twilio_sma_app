class CreateSlotBookings < ActiveRecord::Migration[7.2]
  def change
    create_table :slot_bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.date :interview_date
      t.time :selected_slot
      t.string :status

      t.timestamps
    end
  end
end
