## README

## users テーブル
| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| nick_name          | string | null: false              |
| first_name         | string | null: false              |
| first_name_kana    | string | null: false              |
| last_name          | string | null: false              |
| last_name_kana     | string | null: false              |
| birth_date         | date   | null: false              |

## Association
- has_many :items dependent: :destroy
- has_many :comments dependent: :destroy
- has_many :trades



## items テーブル
| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| item_name             | string     | null: false                    |
| info                  | text       | null: false                    |
| category_id           | integer    | null: false                    |
| sales_status_id       | integer    | null: false                    |
| sell_price            | integer    | null: false                    |
| sipping_fee_status_id | integer    | null: false                    |
| sipping_scheduled_id  | integer    | null: false                    |
| prefecture_id         | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

## Association
- has_many   :comments dependent: :destroy
- belongs_to :user
- has_one    :trade


## destinations テーブル
| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| city          | string     | null: false                    |
| addresses     | string     | null: false                    |
| building      | string     |                                |
| postal_code   | string     | null: false                    |
| phone_number  | string     | null: false                    |
| prefecture_id | integer    | null: false　　　　　　　　　　　　|
| user          | references | null: false, foreign_key: true |

## Association
- belongs_to :trade


## trades テーブル
| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| item          | references | null: false, foreign_key: true |
| destination   | references | null: false, foreign_key: true |

## Association
- belongs_to :item
- belongs_to :user
- has_one    :destination

## comments テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item
