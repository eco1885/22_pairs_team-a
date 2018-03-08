# README
# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|mail|string|null: false, unique:true|
|birthday|integer|null: false|
|residence|string|null:false|
|gender|integer|null:false|

has_many :images
has_many :groups
has_one  :profile
has_one :female
has_one :man
has_many :communities, through: :members

## user_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|content|string||
|user_id|references|null: false, foreign_key:true|
|status|integer||

belongs_to :user

## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key:true|
|age|integer||

belongs_to :user

## mansテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key:true|

has_many :followers, through: :relationships
belongs_to :user

## femalesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key:true|

has_many :followings, through: :relationships
belongs_to :user

## relationshipsテーブル

|Column|Type|Options|
|------|----|-------|
|follow_to_man|references|null: false, foreign_key:true|
|follow_to_female|references|null: false, foreign_key:true|
|match_man_id|referances|null: false, foreign_key:true|
|match_female_id|referances|null: false, foreign_key:true|

belongs_to :man
belongs_to :female


## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|content|string|null: false|
|rerationsships_id|integer|null: false, foreign_key:true|
|image_url|string||

belongs_to :relationships

## communitiesテーブル

|Column|Type|Options|
|------|----|-------|
|category|integer|null: false|
|community_name|string|null: false|
|image_url|string|null: false|

has_many :users, through: :members

## membersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|community_id|integer|null: false, foreign_key: true|

belongs_to :community
belongs_to :user
