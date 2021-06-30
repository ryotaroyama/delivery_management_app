# 【納期管理アプリ】  
簡易的に注文の納期を確認できるアプリです。

## 背景
前職の取引先に営業を行い、受注開発をしました。
老舗の会社であり、社長自らが営業を行い、機械工具の仲介をしております。
何かお手伝いできないかと相談したところ、「加工品の納期を管理したい」との事で、このアプリを制作しました。

## ポートフォリオURL
https://delivery-management-staging.herokuapp.com/

## 工夫した点
#### ①Lineログイン機能を実装
社長自ら営業、発注を行う事から、現状は社長のみが使用するため、使用頻度の高いLineを使用する事にしました。
「Lineを使用した機械部品の発注も多い」という事をお聞きし、使用しやすい機能を意識しました。

#### ②工程を列挙型で実装
加工品の製品は、塗装 → 研磨 → 加工 → アルマイトと工程が決まっているため、列挙型で実装を行いました。
工程毎に加工会社や加工時間が違うため、それぞれの納期を確認できるようにしました。

#### ③モーダルで簡単に納期を確認できるように実装
工程によっては、1ヶ月以上加工時間がかかるため、簡単に納期が確認できるようにモーダルで実装を行いました。
納入先を押すと納期がすぐに確認できることで、「この機能が特に良い」というお言葉を頂きました。

## 苦労した点　　　
#### ①コードを実装するまでに時間がかかってしまったこと
作業を想定して色々な機能を提案したことで実装するまでに時間がかかってしまいました。
認識のズレを起こさないように電話で数回連絡を取り、画面遷移図の書き直しを数回行いました。
結果、多くの機能は必要ではありませんでしたが、必要とされた物を形にする経験をすることができたので、非常に良い経験になりました。

#### ②使用したことのない技術を実装したこと
必要な機能を調べ、実装していく過程は「使用したことのない技術」と向き合う時間でした。試しに色々とコードを書いてみることで、新しい技術を得る経験を積むことができました。
ポジティブに向き合うことで、1つ1つの壁を乗り越えていきました。

## 使用動画
画像や動画も

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

## テーブル設計
