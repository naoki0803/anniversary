
# アプリケーション名	
 ### Anniversary<br><br>

# アプリケーション概要
・ 記念日にフォーカスしたSNS (投稿、いいね、フォローなど)<br>
・ 記念日の管理機能 (経過日数 / あと何日 / 通知)

# URL
	http://post-anniversary.com

# テスト用アカウント
ID：123@abc.com<br>
PW：111111a

# 利用方法
## 未ログインでの投稿一覧閲覧
TopPageヘッダーの「All contents」から未ログインで他社の登録一覧が閲覧可能
※今後公開範囲の追加実装予定

## ユーザー新規登録
TopPageのSignupより、必要事項を入力して新規ユーザー登録

## 新規投稿
新規ユーザー登録直後 or Login → 「サイドバー下部のUserName」 → 「New anniversary」をクリック

## 自身の投稿を確認
サイドバー内の「Home」をクリック

## 自身の投稿の編集削除
投稿内容右上の「UserName」 → 「Edit or Destroy」

## 投稿内容の詳細 & コメントの投稿
投稿内容上部の「記念日名」をクリック

## 投稿へのいいね
投稿内容右下の「♡」をクリック

## 記念日リストの確認
サイドバー内の「List」をクリック<br>
※あらかじめ設定している記念日候補に対して、次の記念日までの日数を確認可能

## 投稿内容の検索
サイドバー内のsearchから検索値を入力<br>
※「記念日名」「記念日の説明」を対象で検索可能

## その他
・ 投稿、SignUp,LogInにバリデーション設定<br>
・ エラーメッセージの日本語化<br>
・ レスポンシブ対応

# アプリケーションを作成した背景
以下の背景から記念日に特化したアプリケーションを作成しました。<br>
・ 初めて寝返った日、初めての離乳食、初めて立った日、初めて喋った言葉、数えきれない位の大切な子供の成長を記録しておきたい<br>
・「生後100日」など、普段は気づかないような日も記念日として祝いたい<br>
・ 記念日などのイベント企画のセンスがなく、他の人が記念日に何をしてるか参考にしたい<br>
<br>

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1ypB9KaDMIZqo-ObOOEHjQHCliz-9AoVNXktRbLH0Wto/edit#gid=982722306

# 実装した機能についての画像やGIFおよびその説明
## 記念日リスト
自身が投稿した内容について、「記念日からの経過日数」「次の記念日までの日数」「次の記念日の日付」を一覧で確認可能
[![Image from Gyazo](https://i.gyazo.com/dd1834be2e5d956e0d3141fb854b1a5d.jpg)](https://gyazo.com/dd1834be2e5d956e0d3141fb854b1a5d)

## 全投稿一覧
他の人が記念日にどんなお祝いをしているかを参考にする為、未ログインでも確認可能
※今後の追加実装で、公開範囲の設定を実装予定
[![Image from Gyazo](https://i.gyazo.com/18c10ffcbbd5f6fe8c7410b154c122db.jpg)](https://gyazo.com/18c10ffcbbd5f6fe8c7410b154c122db)

## 自身の投稿一覧
自分の投稿した内容を確認可能<br>
また、記念日名のリンク先 or 「コメントを表示」から、コメントを確認可能 
[![Image from Gyazo](https://i.gyazo.com/917449292550457860ca2a9a02fac77f.jpg)](https://gyazo.com/917449292550457860ca2a9a02fac77f)

# 実装予定の機能
フォロー機能
通知機能(次の記念日が近づいた時)
公開範囲

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/09443bb7192ecbaf0df1a3f634759375.png)](https://gyazo.com/09443bb7192ecbaf0df1a3f634759375)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/f2227e7d8ed372c89b774b5a255941bc.png)](https://gyazo.com/f2227e7d8ed372c89b774b5a255941bc)

# 開発環境
## フロント
HTML / CSS / JavaScript / jquery / Bootstrap

## バックエンド
Ruby / Ruby on Rails

## インフラ
AWS / EC2 / Route53 / S3 / Nginx / Unicorn

## テスト
rspec-rails
factory_bot_rails
faker

## テキストエディタ
Vscode

## タスク管理
Notion

# ローカルでの動作方法
%	git clone https://github.com/naoki0803/anniversary.git<br>
% cd anniversary<br>
% bundle install<br>
% yarn install<br>

# 工夫したポイント
2人目の子供が生まれて間もない時期のアプリ作成でしたが、<br>
一人目の時に１００日記念などが気づいたらすぎていたっという経験があり、<br>
小さな記念日や日々どんどんできる事が増えていく子供の成長を記録したいと思い、<br>
anniversaryを作成しました。<br>

<br>
テックキャンプで学習したCRUDや検索など基本的な機能は全て盛り込みました<br>
また、記念日リストに関しては、あらかじめ配列で登録してある日と、<br>
投稿した記念日を計算して出力する事で、<br>
動的な情報を確認する事ができるようになっています。<br>
実際に、2人目の子供の記念日をアプリを通して確認するなど実用化できています。<br>

<br>

レイアウトに関してはレスポンシブに対応させたり、<br>
Route53を活用して独自ドメインで接続できるようにもしています。<br>


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