class CreateFamilyMembers < ActiveRecord::Migration
  def change
    create_table :family_members do |t|
      t.text :name
      t.string :relationship
      t.integer :age
      t.text :email
      t.string :gender
      t.belongs_to :profile

      t.timestamps null: false
    end
  end
end
