FactoryBot.define do

  factory :user do
    nickname              {"konyaga"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    family_name           {"山田"}
    family_name_reading   {"ヤマダ"}
    first_name            {"太郎"}
    first_name_reading    {"タロウ"}
    birth_day             {"1900-01-01"}
  end

end