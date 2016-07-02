class CreateFamilyRelations < ActiveRecord::Migration
  def change
    create_table :family_relations do |t|
      t.integer :profile_id
      t.string  :family_name
      t.integer :family_age
      t.date    :family_dob
      t.text    :family_gender
      t.string  :family_blood_group
      t.string  :family_relationship
      t.string  :family_education
      t.string  :family_occupation
      t.attachment :family_image
      t.timestamps null: false
    end
  end
end
