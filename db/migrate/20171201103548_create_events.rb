class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :event_title
      t.text :event_body
      t.string :event_remark
      t.datetime :event_datetime
      t.string :event_address
      t.integer :event_people
      t.float :latitude
      t.float :longitude
      t.string :image_id
      t.integer :user_id

      t.timestamps
    end
  end
end
