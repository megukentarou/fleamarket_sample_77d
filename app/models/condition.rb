class Condition < ActiveHash::Base
  self.data = [
      {id: 1, conditon: '新品、未使用'},
       {id: 2, conditon: '未使用に近い'},
       {id: 3, conditon: '目立った傷や汚れなし'},
       {id: 4, conditon: 'やや傷や汚れあり'},
       {id: 5, conditon: '傷や汚れあり'},
       {id: 6, conditon: '全体的に状態が悪い'}
  ]
end