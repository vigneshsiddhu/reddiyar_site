class CreateOccupations < ActiveRecord::Migration
  def change
    create_table :occupations do |t|
    	t.string :organisation
    	t.string :category
    	t.string :position
    	t.belongs_to :profile

      t.timestamps null: false
    end
  end
end
