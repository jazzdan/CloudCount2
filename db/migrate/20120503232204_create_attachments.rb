class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :budget_id
      t.string :name
      t.string :label
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
