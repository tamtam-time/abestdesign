# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |

### Association

- has_many :designs
- has_many :tags

## designs テーブル

| Column     | Type       | Options                         |
| ---------- | ---------- | ------------------------------- |
| title      | string     | null: false                     |
| file_name  | text       | null: false                     |
| user       | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_many :tags

## tags テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| tag_name  | text       | null: false                    |
| prototype | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tag