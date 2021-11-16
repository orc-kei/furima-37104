furima-37104ER図

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| name               | string | null: false               |
| name_kana          | string | null: false               |
| date_of_birth      | string | null: false               |

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | text       | null: false                    |
| description   | text       | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| delivery      | string     | null: false                    |
| prefecture    | string     | null: false                    |
| delivery_days | string     | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false,foreign_key: true  |

## buys テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| title        | text       | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

## address テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| house_number | string     | null: false                    |
| building     | string     | null: false                    |
| phone_number | string     | null: false                    |
| user         | references | null: false, foreign_key: true |
| buy          | references | null: false,foreign_key: true  |