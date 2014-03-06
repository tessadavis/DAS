class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|

    	t.integer :user_id
    	t.timestamps
    end

    add_index :documents, :user_id
    add_attachment :documents, :add_attachment
    add_column :contacts, :document_id, :integer
  end
end
