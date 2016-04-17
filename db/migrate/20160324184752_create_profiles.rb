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
      t.integer :pin_code_1
      t.text :city_1
      t.text :district_1
      t.text :address_1
      t.integer :pin_code_2
      t.text :city_2
      t.text :district_2
      t.text :address_2
      t.belongs_to :profile

      t.timestamps null: false
    end
  end
end
