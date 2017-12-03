class CreateCats < ActiveRecord::Migration[5.1]
  def change
    create_table :cats do |t|
      t.string :cat_name
      t.integer :cat_age
      t.integer :cat_sex
      t.integer :cat_breed
      t.integer :cat_prefecture
      t.text :cat_description
      t.integer :user_id

      t.timestamps
    end
  end
end
