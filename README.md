# テーブル設計

## users テーブル

| Column          | Type    | Options                   |
| ----------------| ------- | ------------------------- |
| nickname        | string  | null: false               |
| email           | string  | null: false, unique: true |
| password        | string  | null: false               |
| last_name       | string  | null: false               |
| first_name      | string  | null: false               |
| last_name_kana  | string  | null: false               |
| first_name_kana | string  | null: false               |
| birthday        | date    | null: false               |

### Association

- has_many :items
- has_many :buys, through: items

## items テーブル

| Column          | Type       | Options                       |
| ----------------| -----------| ------------------------------|
| image           | string     | null: false                   |
| name            | string     | null: false                   |
| content         | text       | null: false                   |
| category_id     | integer    | null: false                   |
| status_id       | integer    | null: false                   |
| fee_id          | integer    | null: false                   |
| area_id         | integer    | null: false                   |
| days_id         | integer    | null: false                   |
| price           | integer    | null: false                   |
| user            | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_many :buys, through: users

## buys テーブル

| Column    | Type       | Options                        |
| ----------| ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| -----------   | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| tel           | string     | null: false                    |
| buy           | references | null: false, foreign_key: true |

### Association

- belongs_to :buy