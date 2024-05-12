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

 * has_many :categories
 * has_many :review
 

 ## items table

 | Colum             | Type        | Options                     |
 |-------------------|-------------|-----------------------------|
 | title             | string      | null: false                 |
 | description	     | text        | null: false                 |
 | price             | integer     | null: false                 |
 | condition	       | String      | null: false                 |
 | category_id	     | Integer     | foreign_key                 |
 | user_id           | integer     | foreign_key                 |
 

 ### Association

* belongs_to :category
* belongs_to :user


### orders table

| Colum             | Type        | Options                     |
|-------------------|-------------|-----------------------------|
| user              | references  | foreign_key                 |
| total_price       | decimal	    | null:false                  |
| item_id           | integer     | references items            |

### Association

* belongs_to :user
* belong_to :item