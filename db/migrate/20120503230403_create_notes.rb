class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.string :contents
      t.integer :budget_id

      t.timestamps
    end
  end
end
