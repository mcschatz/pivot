class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :full_name
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip
      t.belongs_to :user
    end
  end
end
