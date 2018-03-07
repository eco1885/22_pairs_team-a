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
has_many :messages
has_many :groups
has_one  :profile
has_many :followings
has_many :followers
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
|age|integer||

belongs_to :user

## followingテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key:true|

has_many :followers, through: :relations
belongs_to :user

## followersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key:true|

has_many :followings, through: :relations
belongs_to :user

## relationshipsテーブル

|Column|Type|Options|
|------|----|-------|
|following_id|references|null: false, foreign_key:true|
|followers_id|references|null: false, foreign_key:true|

belongs_to :following
belongs_to :follower


## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|content|string|null: false|
|rerationsships_id|integer|null: false, foreign_key:true|
|image_url|string||

belongs_to :relations

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
