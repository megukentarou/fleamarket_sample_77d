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
|user_name|string||
|birthday|integer||
|phone|string||
|prefectures|string||
|city|string||
|adress|integer||
|buliding|string||
|nick_name|string|null: false|
|zip_code|integer||
|email|string|null: false, unique:true|
|password|string|null: false|
|profile_text|string||

### Association
- has_many :credit_cards
- has_one :consignor
- has_many :items

## consignorテーブル(発送元)
- 商品送付先住所情報
 - 送付先氏名が、名字と名前でそれぞれ必須
 - 送付先氏名のふりがなが、名字と名前でそれぞれ必須
 - 郵便番号が必須
 - 都道府県が必須
 - 市区町村が必須
 - 番地が必須
 - マンション名やビル名、そしてその部屋番号は任意
 - お届け先の電話番号は任意

|Column|Type|Options|
|------|----|-------|
|prefectures|string|null: false|
|city|string|null: false|
|adress|integer|null: false|
|buliding|string||
|family_name|string|null: false|
|family_kana|string|null: false|
|name|string|null: false|
|name_kana|string|null: false|
|zip_code|integer|null: false|

### Association
- belongs_to :user


## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer||
|expiration_year|integer||
|expiration_month|integer||
|security_code|integer||

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
|item_name|string|null: false|
|explanation|string|null: false|
|price|integer|null: false|
|consignor|integer||
|size|string||
|condition|string|null: false|
|delivery_day|string|null: false|
|fee|string|null: false|

### Association
- belongs_to :user
- belongs_to :main_category
- has_one :brands
- has_many :images


## main_categorysテーブル
- カテゴリーの情報が必須

|Column|Type|Options|
|------|----|-------|
|text|string|null: false|

### Association
- has_many :items
- has_many :sub_categorys


## sub_categorysテーブル
- カテゴリーの情報が必須

|Column|Type|Options|
|------|----|-------|
|text|string|null: false|

### Association
- belongs_to :main_category
- has_many :minimum_categorys


## minimum_categorysテーブル
- カテゴリーの情報が必須

|Column|Type|Options|
|------|----|-------|
|text|string|null: false|

### Association
- belongs_to :sub_category

## brandsテーブル
- ブランドについての情報は任意

|Column|Type|Options|
|------|----|-------|
|text|string||

### Association
- belongs_to :item

## imagesテーブル
- 画像は1枚以上必須
- 画像は複数枚投稿することができる

|Column|Type|Options|
|------|----|-------|
|text|string|null: false|

### Association
- belongs_to :item



* ...
