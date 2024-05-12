# DB設計

## users table

 | Column             | Type       | Options                    |
 |--------------------|------------|----------------------------|
 | email              | string     | null: false, unique: true  |
 | encrypted_password | string     | null: false                |
 | username           | string     | null: false, unique: true  |
 | name               | string     | null: false                |
 | profile            | text       | null: false                |
 | occupation         | string     | null: false                |
 | position           | string     | null: false                |
 | created_at         | datetime   | not null, default: current_timestamp|
 | update_at          | datetime   | not null, default: current_timestamp|

 ### Association

 * has_many :categories
 * has_many :review
 

 ## items table

 | Colum             | Type        | Options                     |
 |-------------------|-------------|-----------------------------|
 | title             | string      | null: false                 |
 | description	     | text        | null: false                 |
 | price             | decimal     | null: false                 |
 | condition	       | string      | null: false                 |
 | category_id	     | integer     | foreign_key                 |
 | user_id           | integer     | foreign_key                 |
 | created_at        | datetime    | not null, default: current_timestamp|
 | updated_at        | datetime    | not null, default: current_timestamp|


 ### Association

* belongs_to :category
* belongs_to :user

## categories table

| Colum             | Type        | Options                     |
|-------------------|-------------|-----------------------------|
| name              | string      | not null, unique            |
| created_at        | datetime    | not null, default: current_timestamp|
| update_at         | datetime    | not null, default: current_timestamp|

### Association

* has_many :items

### orders table

| Colum             | Type        | Options                     |
|-------------------|-------------|-----------------------------|
| user_id           | integer     | foreign_key                 |
| total_price       | decimal	    | null:false                  |
| status            | string      | null:false                  |
| created_at        | datetime    | not null, default: current_timestamp|
| updated_at        | datetime    | not null, default: current_timestamp|

### Association

* belongs_to :user
* has_many :order_items

### reviews table

| Colum             | Type        | Options                     |
|-------------------|-------------|-----------------------------|
| user_id           | integer     | foreign_key                 |
| item_id           | integer     | foreign_key                 |
| rating            | integer     | null:false                  |
| comment           | text        |                             |
| created_at        | datetime    | not null, default: current_timestamp|
| updated_at        | datetime    | not null, default: current_timestamp|

### Association

* belongs_to :user
* belongs_to :item