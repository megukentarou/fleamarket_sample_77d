FactoryBot.define do

  factory :item do
    name               {"グッチのバッグ"}     
    explanation        {"ボロボロな感じです"}
    price              {"200000"} 
    delivery_day_id       {2} 
    fee_id                {1} 
    category_id           {2}
    condition_id          {1}
    prefecture_id         {1}
    residency_id          {1}
    user_id               {1}
  end

end

