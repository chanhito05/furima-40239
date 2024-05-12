# DB設計

## users table

 | Column             | Type       | Options                    |
 |--------------------|------------|----------------------------|
 | email              | string     | null: false, unique: true  |
 | encrypted_password | string     | null: false                |
 | nick_name          | string     | null: false                |
 | last_name          | string     | null: false                |
 | first_name         | string     | null: false                |
 | lase_name_kana     | string     | null: false                |
 | first_name_kana    | string     | null: false                |
 | birth_day          | date       | null: false                |


 ### Association

 * has_many :items
 * has_many :orders
 

 ## items table

 | Colum             | Type        | Options                     |
 |-------------------|-------------|-----------------------------|
 | title             | string      | null: false                 |
 | description       | string      | null: false                 |
 | price             | integer     | null: false                 |
 | condition_id      | integer     | null: false                 |
 | category_id	     | integer     | null: false                 |
 | user_id           | integer     | foreign_key                 |
 | status_id         | reference   | foreign_key, null:false     |
 | free_payer_id     | integer     | null: false                 |
 | city_id           | integer     | null: false                 |
 | shipping_date_id  | integer     | null: false                 |

 ### Association

* has_many :orders
* belongs_to :user
* belongs_to :shipping addresses


### order table

| Colum             | Type        | Options                     |
|-------------------|-------------|-----------------------------|
| user              | references  | foreign_key, null: false    |
| item              | references  | references items, foreign_key,null: false|

### Association

* belongs_to :user
* belong_to :items
* belong_to :shipping_addresses

### shipping_addresses table

| Colum             | Type        | Options                     |
|-------------------|-------------|-----------------------------|
| postal_code       | string      | null: false                 |
| prefecture        | string      | null: false                 |
| city              | string      | null: false                 |
| address_line1     | string      | null: false                 |
| address_line2     | string      |                             |
| phone_number      | string      | null: false                 | 


 ### Association

* belongs_to :item
* has_many :orders
