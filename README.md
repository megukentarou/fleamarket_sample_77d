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
|nickname|string|null: false|
|email|string|null: false, unique:true|
|encrypted_password|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_reading|string|null: false|
|first_name_reading|string|null: false|
|birth_day|date|null: false|

### Association
- belongs_to_active_hash :condition
- belongs_to_active_hash :delivery_day
- belongs_to_active_hash :fee
- belongs_to_active_hash :prefecture
- belongs_to :user
- has_many :images, dependent: :destroy
- accepts_nested_attributes_for :images
- has_one :soldout


## residenciesテーブル(住所)
 - 郵便番号が必須
 - 市区町村が必須
 - 番地が必須
 - マンション名やビル名、そしてその部屋番号は任意

|Column|Type|Options|
|------|----|-------|
|prefecture_id(acitve_hash)|integer|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_reading|string|null: false|
|first_name_reading|string|null: false|
|city|string|null: false|
|address|string|null: false|
|zip_code|string|null: false|
|building|string|
|phone|string|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to_active_hash :prefecture
- belongs_to :user, optional: true


## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_id|integer|null: false|
|token|string|null: false|
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
- 配送料の負担についての情報が必須
- 発送元の地域についての情報が必須(都道府県の事を指す)
- 発送までの日数についての情報が必須
- 価格についての情報が必須

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|explanation|string|null: false|
|delivery_day_id|integer|null: false|
|fee_id|integer|null: false|
|brand|string||
|condition_id|integer|null: false|
|prefecture_id|integer|null: false|
|category_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to_active_hash :condition
- belongs_to_active_hash :delivery_day
- belongs_to_active_hash :fee
- belongs_to_active_hash :prefecture
- belongs_to :user
- has_many :images, dependent: :destroy
- accepts_nested_attributes_for :images
- has_one :soldout

## categoriesテーブル
- カテゴリーの情報が必須

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|

### Association
- has_many :items
- has_ancestry


## imagesテーブル
- 画像は1枚以上必須
- 画像は複数枚投稿することができる

|Column|Type|Options|
|------|----|-------|
|url|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item

## soldout(売却済み)テーブル
- 外部キーとして売却済みを管理する

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user

## ER図（URL）
https://drive.google.com/file/d/1cq6Yql1uTnw0qAZnIx0Pi92um7jvuVx9/view?usp=sharing

* ...
