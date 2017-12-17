class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :article_title
      t.text :article_body
      t.string :image_id
      t.integer :user_id

      t.timestamps
    end
  end
end
