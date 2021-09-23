# テーブル設計

## users テーブル

| Column                  | Type     | Options     |
| ----------------------- | -------- | ----------- |
| nickname                | string   | null: false |
| email                   | string   | null: false |
| encrypted_password      | string   | null: false |
| password_confirmation   | string   | null: false |
| first_name              | string   | null: false |
| last_name               | string   | null: false |
| first_name_reading      | string   | null: false |
| last_name_reading       | string   | null: false |
| birthday                | integer  | null: false |

### Association

- has_many :items

## items テーブル

| Column         | Type          | Options                        |
| ---------------| ------------- | ------------------------------ |
| image          | ActiveStorage | null: false                    |
| title          | string        | null: false                    |
| explanation    | text          | null: false                    |
| category       | integer       | null: false                    |
| status         | integer       | null: false                    |
| load           | integer       | null: false                    |
| shipment       | integer       | null: false                    |
| shipping_days  | integer       | null: false                    |
| price          | integer       | null: false                    |
| user_id        | references    | null: false, foreign_key: true |

### Association

- belongs_to :purchase
- belongs_to :user

## purchase テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| card_number       | string     | null: false                    |
| expiry            | integer    | null: false                    |
| security_code     | integer    | null: false                    |
| postal_code       | string     | null: false                    |
| prefecture        | integer    | null: false                    |
| municipalities    | string     | null: false                    |
| house_number      | string     | null: false                    |
| building_name     | string     |                                |
| telephone_number  | integer    | null: false                    |
| item_id           | references | null: false, foreign_key: true |

### Association

- has_one :item