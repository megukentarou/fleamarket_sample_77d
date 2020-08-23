## freamarket_sample DB設計

## usersテーブル
- ユーザー情報
 - ニックネームが必須
 - メールアドレスは一意である
 - メールアドレスは@とドメインを含む必要がある
 - パスワードが必須
 - パスワードは7文字以上
 - パスワードは確認用を含めて2回入力する

- 本人確認情報
 - ユーザー本名が、名字と名前でそれぞれ必須
 - ユーザー本名は全角で入力させる
 - ユーザー本名のふりがなが、名字と名前でそれぞれ必須
 - ユーザー本名のふりがなは全角で入力させる
 - 生年月日が必須

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|birthday|integer|null: false|
|phone|string||
|nick_name|string|null: false|
|email|string|null: false, unique:true|
|password|string|null: false|
|profile_text|string||

### Association
- has_many :credit_cards
- has_one :consignor
- has_many :items
- has_many :residencys

### residencysテーブル(住所)
 - 郵便番号が必須
 - 都道府県が必須
 - 市区町村が必須
 - 番地が必須
 - マンション名やビル名、そしてその部屋番号は任意

|Column|Type|Options|
|------|----|-------|
|prefectures|string|null: false|
|city|string|null: false|
|address|integer|null: false|
|building|string|null: false|
|zip_code|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :residency

## consignorsテーブル(発送元)
- 商品送付先住所情報
 - 送付先氏名が、名字と名前でそれぞれ必須
 - 送付先氏名のふりがなが、名字と名前でそれぞれ必須 
 - お届け先の電話番号は任意

|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|family_kana|string|null: false|
|name|string|null: false|
|name_kana|string|null: false|
|phone|string||
|user_id|integer|null: false, foreign_key: true|
|residency_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :residency


## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_id|integer||
|customer_id|integer||
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user


## itemsテーブル
- 画像は1枚以上必須
- 画像は複数枚投稿することができる
- 商品名が必須
- 商品の説明が必須
- カテゴリーの情報が必須
- ブランドについての情報は任意
- 商品の状態についての情報が必須
- 配送料の負担についての情報が必須
- 発送元の地域についての情報が必須
- 発送までの日数についての情報が必須
- 価格についての情報が必須

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|explanation|string|null: false|
|condition|string|null: false|
|delivery_day|string|null: false|
|fee|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer||
|consignor_id|integer|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_many :images
- has_one :consignor

## categorysテーブル
- カテゴリーの情報が必須

|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|ancestry|string|null: false|

### Association
- has_many :items

## brandsテーブル
- ブランドについての情報は任意

|Column|Type|Options|
|------|----|-------|
|text|string|null: false|

### Association
- has_many :item

## imagesテーブル
- 画像は1枚以上必須
- 画像は複数枚投稿することができる

|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item

## ER図（URL）
https://drive.google.com/file/d/1cq6Yql1uTnw0qAZnIx0Pi92um7jvuVx9/view?usp=sharing

* ...
