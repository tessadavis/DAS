class RemoveInfoNameFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :field_name, :info
  end
end
