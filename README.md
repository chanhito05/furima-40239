# DB設計

## users table

 | Column             | Type       | Options                    |
 |--------------------|------------|----------------------------|
 | email              | string     | null: false, unique: true  |
 | encrypted_password | string     | null: false                |
 | last_name          | string     | null: false,               |
 | first_name         | string     | null: false                |
 | lase_name_kana     | string     | null: false                |
 | first_name_kana    | string     | null: false                |
 | birth_day          | date       | not null                   |


 ### Association

 * belong_to :item
 * has_many :order
 * has_many :shipping_addresses
 

 ## items table

 | Colum             | Type        | Options                     |
 |-------------------|-------------|-----------------------------|
 | title             | string      | null: false                 |
 | description_id	   | integer     | null: false                 |
 | price             | integer     | null: false                 |
 | condition_id      | integer     | null: false                 |
 | category_id	     | integer     | foreign_key                 |
 | user_id           | integer     | foreign_key                 |
 | status_id         | integer     | null: false                 |
 | image             | string      | null: false                 |
 | free_payer_id     | integer     | null: false                 |
 | city_id           | integer     | null: false                 |
 | day_id            | integer     | null: false                 |

 ### Association

* belongs_to :order
* belongs_to :user


### orders table

| Colum             | Type        | Options                     |
|-------------------|-------------|-----------------------------|
| user              | references  | foreign_key,not null        |
| item_id           | reference   | references items, foreign_key,not null|

### Association

* belongs_to :user
* has_many :item

### shipping addresses

| Colum             | Type        | Options                     |
|-------------------|-------------|-----------------------------|
| fee_payer_id      | integer     | null: false                 |
| area_id           | integer     | null: false                 |
| day_id            | integer     | null: false                 |


 ### Association

* belongs_to :user
