class CreateGives < ActiveRecord::Migration
  def change
    create_table :gives do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.string :description
      t.integer :price
      t.string :image
      t.string :picture_file_name
      t.string :picture_content_type
      t.integer :picture_file_size
      t.datetime :picture_updated_at

      t.timestamps null: false
    end
  end
end
