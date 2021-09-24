# テーブル設計

## users テーブル

| Column                  | Type     | Options                   |
| ----------------------- | -------- | ------------------------- |
| nickname                | string   | null: false               |
| email                   | string   | null: false, unique: true |
| encrypted_password      | string   | null: false               |
| password_confirmation   | string   | null: false               |
| first_name              | string   | null: false               |
| last_name               | string   | null: false               |
| first_name_reading      | string   | null: false               |
| last_name_reading       | string   | null: false               |
| birthday                | Date     | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column           | Type          | Options                        |
| -----------------| ------------- | ------------------------------ |
| title            | string        | null: false                    |
| explanation      | text          | null: false                    |
| category_id      | integer       | null: false                    |
| status_id        | integer       | null: false                    |
| load_id          | integer       | null: false                    |
| prefecture_id    | integer       | null: false                    |
| shipping_days_id | integer       | null: false                    |
| price            | integer       | null: false                    |
| user             | references    | null: false, foreign_key: true |

### Association

- belongs_to :purchase
- belongs_to :user

## purchase テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

### Association

- has_one :item
- belongs_to :address
- belongs_to :user

## addresses テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| postal_code       | string     | null: false                    |
| prefecture_id     | integer    | null: false                    |
| municipalities    | string     | null: false                    |
| house_number      | string     | null: false                    |
| building_name     | string     |                                |
| telephone_number  | integer    | null: false                    |
| purchase          | references | null: false, foreign_key: true |

### Association

- has_one :purchase