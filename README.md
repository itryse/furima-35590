# テーブル設計

# usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null , false              |
| email              | string | unique: true              |
| password           | string | null , false, default: "" |
| encrypted_password | string | null , false, default: "" |
| name               | string | null , false              |
| birthday           | string | null , false              |

# Association
- has_many :products
- has_many :purchase_records

# products（商品情報）テーブル
| Column               | Type      | Options                         |
| -------------------- | --------- | ------------------------------- |
| product_name         | string    | null , false                    |
| category             | string    | null , false                    |
| price                | integer   | null , false                    |
| product_introduction | text      | null , false                    |
| product_condition    | string    | null , false                    |
| postage              | string    | null , false                    |
| shipping_area        | string    | null , false                    |
| day_to_ship          | string    | null , false                    |
| name_id              | reference | null , false ,foreign_key: true |

# Association
- belongs_to :users
- has_one :purchase_records

# purchase_records（購入記録）テーブル
| Column           | Type      | Options                         |
| ---------------- | --------- | ------------------------------- |
| purchase_name    | string    | null , false                    |
| purchase_product | string    | null , false                    |
| user_id          | reference | null , false ,foreign_key: true |
| product_id       | reference | null , false ,foreign_key: true |

# Association
- belongs_to :users
- belongs_to :products
- has_one :shipping_information

# shipping_information（配送先）テーブル
| Column             | Type      | Options                         |
| ------------------ | --------- | ------------------------------- |
| postal_code        | string    | null , false                    |
| prefecture         | string    | null , false                    |
| city               | string    | null , false                    |
| house_number       | string    | null , false                    |
| building_name      | string    |                                 |
| phone_number       | integer   | null , false                    |
| purchase_record_id | reference | null , false ,foreign_key: true |


# Association
- belongs_to :purchase_records