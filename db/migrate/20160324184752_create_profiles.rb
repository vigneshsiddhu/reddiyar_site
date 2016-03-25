class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.text :name
      t.integer :age
      t.date :dob
      t.text :email
      t.integer :pincode
      t.string :city
      t.text :gender
      t.text :caste
      t.text :address
      t.integer :mobile, limit: 8
      t.string :blood_group
      t.attachment :image
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
