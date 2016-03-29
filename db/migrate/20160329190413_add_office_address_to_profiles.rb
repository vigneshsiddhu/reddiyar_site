class AddOfficeAddressToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :office_address, :string
    add_column :profiles, :father_name, :string
    add_column :profiles, :anniversary_date, :date
    add_column :profiles, :occupation, :string
    add_column :profiles, :education, :string
    add_column :profiles, :married_status, :string
  end
end
