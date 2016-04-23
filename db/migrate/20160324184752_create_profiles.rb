class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.text :name
      t.integer :mobile, limit: 8
      t.date :dob
      t.text :gender
      t.text :caste
      t.string :blood_group
      t.string :marital_status
      t.integer :height
      t.integer :weight
      t.attachment :image
      t.boolean :verified, default: false
      t.belongs_to :user

      t.timestamps null: false  
    end

    create_table :educations do |t|
      t.text :institution
      t.text :type_of_education
      t.text :specialisation
      t.date :year_of_completion
      t.text :city
      t.text :achievements
      t.belongs_to :profile

      t.timestamps null: false
    end

    create_table :family_members do |t|
      t.text :relationship
      t.integer :member_id
      t.boolean :approved
      t.belongs_to :profile

      t.timestamps null: false
    end

    create_table :locations do |t|
      t.integer :pin_code
      t.text :city
      t.text :district
      t.text :address
      t.text :address_type
      t.belongs_to :profile

      t.timestamps null: false
    end
  end
end
