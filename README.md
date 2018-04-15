# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
2.3.1p112
* DataBase structure

## groupテーブル
|Column|type|option|
|------|----|------|
|name|string|null: false, unique: true|

### association
* has_many :members
* has_many :users, through: :members
* has_many :charges


## userテーブル
|Column|type|option|
|------|----|------|
|name|string|null: false, unique: true|
Email not included

### association
* has_many :members
* has_many :groups, through: :members
* has_many :comments
* has_many :debts
* has_many :charges


## memberテーブル
|Column|type|option|
|------|----|------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|


### association
* belongs_to :group
* belongs_to :user


## chargeテーブル
|Column|type|option|
|------|----|------|
|title|string|null: false, unique: true if group_id is same|
|amount|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|charged_user_id|integer|null: false, foreign_key: true|

### association
* belongs_to :group
* belongs_to :user
* has_many :comments
* has_many :debts


<!-- ## commentテーブル
|Column|type|option|
|------|----|------|
|body|string|null: false|
|user_id|integer|null: false, foreign_key: true|

### association
* belongs_to :charge
* belongs_to :user
