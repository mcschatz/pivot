class CreateContent < ActiveRecord::Migration
  def change
    create_table :content do |t|
      t.text :name
      t.text :payload
    end
  end
end
