# DB設計

## users table

 | Column             | Type       | Options                    |
 |--------------------|------------|----------------------------|
 | email              | string     | null: false, unique: true  |
 | encrypted_password | string     | null: false                |
 | nick_name          | string     | null: false                |
 | last_name          | string     | null: false                |
 | first_name         | string     | null: false                |
 | last_name_kana     | string     | null: false                |
 | first_name_kana    | string     | null: false                |
 | birthday          | date       | null: false                |


 ### Association

 * has_many :items
 * has_many :orders
 

 ## items table

 | Colum             | Type        | Options                     |
 |-------------------|-------------|-----------------------------|
 | title             | string      | null: false                 |
 | description       | text        | null: false                 |
 | shipping_fee_burden_id| integer | null: false                 |
 | condition_id      | integer     | null: false                 |
 | category_id	     | integer     | null: false                 |
 | shipping_region_id| integer     | null: false                 |
 | shipping_days_id  | integer     | null: false                 |
 | user              | references  | foreign_key: true, null: false|
 ### Association

* has_one :order
* belongs_to :user


### purchases table

| Colum             | Type        | Options                     |
|-------------------|-------------|-----------------------------|
| user              | references  | foreign_key, null: false    |
| item              | references  | foreign_key,  null: false   |

### Association

* belongs_to :user
* belong_to :item
* has_one :shipping_address

### addresses table

| Colum             | Type        | Options                     |
|-------------------|-------------|-----------------------------|
| postal_id         | string      | null: false                 |
| shipping_region_id| integer     | null: false                 |
| city              | string      | null: false                 |
| address_line1     | string      | null: false                 |
| address_line2     | string      |                             |
| phone_number      | string      | null: false                 | 
| order             | references  | foreign_key: true ,null: false|


 ### Association

* belong_to :order
