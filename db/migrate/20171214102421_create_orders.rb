class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :order_name
      t.string :order_tel
      t.date :order_birth
      t.integer :order_sex
      t.string :order_postal_code
      t.integer :order_prefecture
      t.string :order_city
      t.string :order_address
      t.string :order_occupation
      t.integer :order_income
      t.string :order_residence
      t.text :order_description
      t.integer :user_id
      t.integer :cat_id

      t.timestamps
    end
  end
end
