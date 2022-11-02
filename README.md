# テーブル設計

## users テーブル
--- 

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :anniversaries
- has_many :follows
- has_many :favorites
- has_many :comments


## anniversaries テーブル
--- 
| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| anniversary_name           | string     | null: false                    |
| anniversary_date           | date       | null: false                    |
| anniversary_description    | string     | null: false                    |
| category_id                | integer    |                                |
| who_anniversary            | string     | null: false                    |
| user                       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :favorites
- has_many :comments


## follows テーブル
--- 

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| follower_id   | references | null: false, foreign_key: true |
| followee_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## favorites テーブル
---

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| anniversary   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :anniversary


## comments テーブル
---

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| comment       | string     |                                |
| user          | references | null: false, foreign_key: true |
| anniversary   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :anniversary