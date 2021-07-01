# 【納期管理アプリ】  
簡易的に注文の納期を確認できるアプリです。

## 背景
前職の取引先に営業を行い、受注開発をしました。
老舗の会社であり、社長自らが営業を行い、機械工具の仲介をしております。
何かお手伝いできないかと相談したところ、「加工品の納期を管理したい」との事で、このアプリを制作しました。

## ポートフォリオURL
https://delivery-manegement-app.herokuapp.com/

#### ＜*お客様に納品したアプリには、LINEログイン機能がついておりますが、ポートフォリオにはついておりません＞

## 工夫した点
#### 1、LINEログイン機能を実装
社長自ら営業、発注を行う事から、現状は社長のみが使用するため、使用頻度の高いLineを使用する事にしました。
「Lineを使用した機械部品の発注も多い」という事をお聞きし、使用しやすい機能を意識しました。

#### 2、工程を列挙型で実装
加工品の製品は、塗装 → 研磨 → 加工 → アルマイトと工程が決まっているため、列挙型で実装を行いました。
工程毎に加工会社や加工期間が違うため、それぞれの納期を確認できるようにしました。

#### 3、モーダルで簡単に納期を確認できるように実装
工程によっては、1ヶ月以上加工時間がかかるため、簡単に納期が確認できるようにモーダルで実装を行いました。
納入先を押すと納期がすぐに確認できることで、「この機能が特に良い」というお言葉を頂きました。

## 苦労した点　　　
#### 1、コードを実装するまでに時間がかかってしまったこと
作業を想定して色々な機能を提案したことで実装するまでに時間がかかってしまいました。
認識のズレを起こさないように電話で数回連絡を取り、画面遷移図の書き直しを数回行いました。
結果、多くの機能は必要ではありませんでしたが、必要とされた物を形にする経験をすることができたので、非常に良い経験になりました。

#### 2、使用したことのない技術を実装したこと
必要な機能を調べ、実装していく過程は「使用したことのない技術」と向き合う時間でした。試しに色々とコードを書いてみることで、新しい技術を得る経験を積むことができました。
ポジティブに向き合うことで、1つ1つの壁を乗り越えていきました。

#### 3、

## 使用動画
![PF動画2](https://user-images.githubusercontent.com/59526478/124051390-65364f00-da57-11eb-81b5-c7b0b7b9e40c.gif)

## イメージ画像
|LINEログイン画面|LINEアカウントログイン画面|トップページ<br />（加工納入先一覧）|簡易納期確認画面<br />（納入先クリック時）|
|---|---|---|---|
|<img width="250" alt="ログイン画面1" src="https://user-images.githubusercontent.com/59526478/123964733-b78f5580-d9ee-11eb-93a5-f114c1862919.png">|<img width="250" alt="ログイン画面(LINE)" src="https://user-images.githubusercontent.com/59526478/123963079-13f17580-d9ed-11eb-861a-8c9318cda928.png">|<img width="250" alt="納入先1 " src="https://user-images.githubusercontent.com/59526478/123967892-b57ac600-d9f1-11eb-9d91-d9801fee8f4f.png">|<img width="250" alt="納入先2" src="https://user-images.githubusercontent.com/59526478/123967899-b6abf300-d9f1-11eb-9344-32e04c226313.png">|

|新規登録画面|詳細画面|編集画面<br />（工程編集時）|納品済一覧|
|---|---|---|---|
|<img width="250" alt="新規登録画面2" src="https://user-images.githubusercontent.com/59526478/123965075-0e952a80-d9ef-11eb-8fc3-42aefbf3436f.png">|<img width="250" alt="詳細画面" src="https://user-images.githubusercontent.com/59526478/123964991-fe7d4b00-d9ee-11eb-990a-13d7943712c7.png">|<img width="250" alt="編集画面1" src="https://user-images.githubusercontent.com/59526478/123973116-71d68b00-d9f6-11eb-96e9-7622448b762b.png">|<img width="250" alt="納品済画面" src="https://user-images.githubusercontent.com/59526478/123965853-d6421c00-d9ef-11eb-956b-bac7a33c6c40.png">|

## 開発環境・使用技術
- フロントエンド(HTML, CSS, Sass, JavaScript, jQuery)
- バックエンド(Ruby, Ruby on Rails)
- DB(PostgreSQL)
- 開発環境(MacOS, VScode, Git, Github, zsh)
- インフラ(Heroku)

## 機能一覧
- Lineログイン機能
- 注文の登録、編集機能
- 注文の削除機能（rakeタスク、Herokuスケジューラー）
- フォームのセレクトタグ検索(flexselect)
- カレンダー機能(flatpickr)
- エラーメッセージ機能

## ER図
![ER図](https://user-images.githubusercontent.com/59526478/123907811-6f9e0d80-d9b1-11eb-88e1-ab4a5c03de94.png)

## 各テーブルについて
| テーブル名 | 説明 |
| :---: | :---: | 
| orders | 注文の情報 |
| customers | 納入先の情報 |
| processors | 加工先の情報 |
| products | 製品の情報 |
| drawing_numbers | 図面番号の情報 |
| users | 登録ユーザーの情報 |
