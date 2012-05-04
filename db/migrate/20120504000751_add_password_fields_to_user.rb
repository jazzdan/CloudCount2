class AddPasswordFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string

    add_column :users, :last_name, :string

    add_column :users, :salt, :string

    add_column :users, :role, :integer, default: 1

    add_column :users, :remember_me, :boolean, default: false

  end
end
