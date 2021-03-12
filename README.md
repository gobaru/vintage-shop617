# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# アプリ名
## Vintage Shop

![dc667024dca45ae871385536477a3b8f](https://user-images.githubusercontent.com/78143375/110903209-72192080-834a-11eb-83e4-3582b146c38a.jpg)

# 機能のご紹介
## 主な機能
- ユーザー投稿型の古着屋、セレクトショップを探すためのアプリです！
- ショップ詳細にコメント欄を実装することでユーザー同士が気軽にコミュニケーションをとる事ができます！
- トップページの検索欄から自分のお気に入りブランドを通り扱うショップを素早く探す事ができます！
## その他機能
- ユーザー登録/ユーザーログイン
- 投稿編集機能/投稿削除機能/投稿詳細表示機能/ユーザー詳細表示機能
- Rspec / Rubocopによるテスト機能
- Basic認証によるセキュリティ機能

![74823688643cb024c0e9c7abfd819ed4](https://user-images.githubusercontent.com/78143375/110903855-6da13780-834b-11eb-87f6-be4862cf8006.jpg)

<img width="1165" alt="2c053e33520fe8ed8521036c9d74dddd" src="https://user-images.githubusercontent.com/78143375/110903864-709c2800-834b-11eb-9cf8-f67822e69aee.png">

# 制作理由
最近ではほぼ全てのショップがオンライン販売を行っているのでどこに住んでいても買い物をする事ができます。
ですが、オンラインで買い物ができても、どんなにいい商品を取り扱う古着屋やセレクトショップがあっても知らない
事には買い物をする事ができません。
そこで、海外ブランドや人気ブランドなどに興味がある洋服好きの大学生〜20代の男性の
「こんなサービスあったらいいな」を叶えるためにVintageShopを作りました。
良い商品を扱っているのに認知度が低いお店などを知っているユーザーが情報を共有する事で、
このサイトを使う事で自分の好みの商品/ブランドを扱うお店をピンポイントで探瀬、
好きな洋服を安く手に入れる事ができるようになります！

# 使用技術
## バックエンド
- Ruby2.6.5
- Ruby on Rails6.0.3.5
## フロントエンド
- html, css
## データベース
- MySQL, SequelPro
## インフラ
- Heroku
## ソース管理
- GitHub, GitHubDesktop
## テスト
- RSpec
## エディタ
- VScode

# 今後実装したい機能
- いいね機能
- 画像の複数枚投稿
- ユーザー同士が直接やりとりできるチャット機能

# URL
## https://vintage-shop617.herokuapp.com/
### Basic認証情報
- ID: gobaru
- PW: 1123
### ログイン情報（テスト用）
- メールアドレス: test@gmail
- パスワード: 123456t

# テーブル設計

## users テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| nickname           | string | null: false                |
| profile            | text   | null: false                |
| email              | string | unique: true, null: false  |
| encrypted_password | string | null: false                |

### Association
- has_many :items
- has_many :comments


## shops テーブル

| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| image             | string      | null: false                    |
| shop_name         | string      | null: false                    |
| bland_name        | string      | null: false                    |
| shop_detail       | text        | null: false                    |
| user_id           | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments


## comments テーブル

| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| text              | text        | null: false                    |
| user              | references  | null: false, foreign_key: true |
| shop              | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :shop
