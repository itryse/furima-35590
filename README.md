# テーブル設計

# usersテーブル
| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| nickname           | string | null : false               |
| email              | string | null : false, unique: true |
| password           | string | null : false, default: ""  |
| encrypted_password | string | null : false, default: ""  |
| last_name          | string | null : false               |
| first_name         | string | null : false               |
| last_name_kana     | string | null : false               |
| first_name_kana    | string | null : false               |
| birth_date         | date   | null : false               |

# Association
- has_many :products
- has_many :purchase_records

# products（商品情報）テーブル
| Column         | Type      | Options                         |
| -------------- | --------- | ------------------------------- |
| name           | string    | null : false                    |
| category_id    | integer   | null : false                    |
| price          | integer   | null : false                    |
| introduction   | text      | null : false                    |
| condition_id   | integer   | null : false                    |
| postage_id     | integer   | null : false                    |
| prefecture_id  | integer   | null : false                    |
| day_to_ship_id | integer   | null : false                    |
| user           | reference | null : false ,foreign_key: true |

# Association
- belongs_to :user
- has_one :purchase_record

# purchase_records（購入記録）テーブル
| Column  | Type      | Options                         |
| ------- | --------- | ------------------------------- |
| user    | reference | null : false ,foreign_key: true |
| product | reference | null : false ,foreign_key: true |

# Association
- belongs_to :user
- belongs_to :product
- has_one :shipping_record

# shipping_records（配送先）テーブル
| Column          | Type      | Options                         |
| --------------- | --------- | ------------------------------- |
| postal_code     | string    | null : false                    |
| prefecture      | integer   | null : false                    |
| city            | string    | null : false                    |
| house_number    | string    | null : false                    |
| building_name   | string    |                                 |
| phone_number    | string    | null : false                    |
| purchase_record | reference | null : false ,foreign_key: true |

# Association
- belongs_to :purchase_record