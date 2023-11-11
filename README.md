# README

## 開発言語
+ Ruby2.6.5
+ Rails5.2.6

## ツール
+ devise
+ Ajax（コメント機能）
+ ransack
+ cocoon

## 本番環境
+ AWS（EC2/ACM/Route53/ALB）
+ PostgreSQL 14.8
+ Nginx 1.22.1
+ Unicorn 5.4.1

## 実行手順
```
$ git clone git@github.com:raphA150208/original_app.git
$ cd original_app
$ bundle install
$ rails db:create && rails db:migrate
$ rails s
```
## チェックシート
https://docs.google.com/spreadsheets/d/1BFmp-oFvzIEcAvG0RDfgFlxHAE-W6GOyA3ocf2arPmc/edit?usp=sharing

## カタログ設計
https://docs.google.com/spreadsheets/d/1ghGFwwXwujQm9lzCBicjZeW1eNFQxEbVqna4f9h_CEk/edit?usp=sharing

## テーブル定義書
https://docs.google.com/spreadsheets/d/1DPzWraZhEss4cOuIBJoSHsS3bm0DmNiFxKZa0cRb174/edit?usp=sharing

## ワイヤーフレーム
https://cacoo.com/diagrams/Uhv3ELdfExBfqdI2/B0A61

## ER図
![スクリーンショット 2021-10-07 15 47 59](https://user-images.githubusercontent.com/79513355/136333640-d1d17c1d-3e6b-48ec-94a3-9387a00ab604.png)
## 画面遷移図
![スクリーンショット 2021-10-06 0 50 16](https://user-images.githubusercontent.com/79513355/136060307-e13566df-f962-442a-8c28-0df0ebdd8f1d.png)