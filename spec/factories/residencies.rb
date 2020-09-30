FactoryBot.define do

  factory :residency do
    user_id             {1}
    family_name         {"田中"}
    first_name          {"太郎"}
    family_name_reading {"タナカ"}
    first_name_reading  {"タロウ"}
    zip_code            {"123-4567"}
    prefecture_id       {13}
    city                {"品川区"}
    address             {"1-1-1"}
    building            {"テック111"}
    phone               {"09012345678"}
  end

end
