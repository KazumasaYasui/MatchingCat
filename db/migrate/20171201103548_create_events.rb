class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :event_title
      t.text :event_body
      t.string :event_remark
      t.string :event_place
      t.datetime :event_datetime
      t.integer :user_id

      t.timestamps
    end
  end
end
