json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :age, :dob, :email, :pincode, :city, :gender, :caste, :address, :mobile, :blood_group
  json.url profile_url(profile, format: :json)
end
