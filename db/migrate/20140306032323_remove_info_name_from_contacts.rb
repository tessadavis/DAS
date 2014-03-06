class RemoveInfoNameFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :info
  end
end
