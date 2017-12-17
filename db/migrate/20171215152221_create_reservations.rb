class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.string :reservation_name
      t.string :reservation_tel
      t.integer :reservation_people
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end
end
