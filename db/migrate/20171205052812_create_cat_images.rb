class CreateCatImages < ActiveRecord::Migration[5.1]
  def change
    create_table :cat_images do |t|
      t.string :image_id
      t.integer :cat_id

      t.timestamps
    end
  end
end
