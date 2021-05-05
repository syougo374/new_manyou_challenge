## README
---
###< テーブル設計 >
1. userモデル

| データ型 | カラム名
|:---:|:---:|
|string |name |
|string |email |
|string |password_digest |
2. taskモデル
   
|データ型|カラム名|
|:---:|:---:|
|string|title|
|text|content|

### < herokuデプロイ手順 >
1. herokuログイン
```
heroku login
```
2. Assetプリコンパイル
```
$ rails assets:precompile RAILS_ENV=production
```
3. git add & git commit
```
git add .
git commit -m ''
```
4. heroku create
```
heroku create
```
5. herokuバージョン変更18
```
$ heroku stack:set heroku-18
```
7. herokuデプロイ
```
git push heroku master
```
9. データの移行（データベースの作成）
```
heroku run rails db:migrate
```
11. heroku 再起動
```
heroku restart
```
13. heroku 動作確認



