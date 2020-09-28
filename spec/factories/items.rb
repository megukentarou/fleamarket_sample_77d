FactoryBot.define do

  factory :item do
    name               {"グッチのバッグ"}     
    explanation        {"ボロボロな感じです"}
    price              {"200000"} 
    delivery_day       {3} 
    fee                {1} 
    # brand              {"シャネル"}
    category_id        {1}
    consignor_id       {1}
    condition_id       {1}
    prefecture_id      {1}

  end

end

