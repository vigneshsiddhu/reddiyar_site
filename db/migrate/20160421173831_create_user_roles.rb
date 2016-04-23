class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles do |t|
      t.integer :role
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
