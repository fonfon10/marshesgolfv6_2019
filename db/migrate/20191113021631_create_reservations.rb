class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.integer :timeslot_id
      t.integer :member_id
      t.integer :activity_id
      t.integer :day_id
      t.integer :bay

      t.timestamps
    end
  end
end
