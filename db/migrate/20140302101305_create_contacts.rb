class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :category
      t.string :area
      t.integer :phone
      t.string :website
      t.string :email
      t.text :info

      t.timestamps
    end
  end
end
