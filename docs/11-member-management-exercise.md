# 11. 会員管理システム演習

## 目的

Strutsを使って、実務に近い会員管理システムを設計・実装します。

## 要件

### 機能一覧

| 機能 | 説明 |
|---|---|
| 会員一覧 | 登録済み会員を一覧表示する |
| 会員検索 | 名前、メールアドレスで検索する |
| 会員登録 | 新規会員を登録する |
| 会員詳細 | 会員情報を表示する |
| 会員編集 | 会員情報を更新する |
| 会員削除 | 会員を削除する |
| ログイン | 管理者のみ利用可能にする |

## 画面一覧

| 画面 | URL | JSP |
|---|---|---|
| ログイン | /login | login.jsp |
| 会員一覧 | /member/list | member-list.jsp |
| 会員登録 | /member/create | member-form.jsp |
| 会員詳細 | /member/detail | member-detail.jsp |
| 会員編集 | /member/edit | member-form.jsp |
| 会員削除確認 | /member/delete-confirm | member-delete-confirm.jsp |
| 完了 | /member/complete | complete.jsp |

## テーブル設計

### members

| カラム | 型 | 説明 |
|---|---|---|
| id | int | 主キー |
| name | varchar | 氏名 |
| email | varchar | メールアドレス |
| phone | varchar | 電話番号 |
| status | varchar | 有効 / 無効 |
| created_at | timestamp | 作成日時 |
| updated_at | timestamp | 更新日時 |

## パッケージ構成

```text
com.example.member
├── action
├── service
├── repository
├── model
├── form
└── exception
```

## 実装順序

1. membersテーブルを作成する
2. Memberモデルを作成する
3. MemberRepositoryを作成する
4. MemberServiceを作成する
5. 一覧Actionを作成する
6. JSPで一覧表示する
7. 登録・編集・削除を追加する
8. Validation Frameworkで入力チェックを追加する
9. Interceptorでログインチェックを追加する

## 入力チェック

| 項目 | チェック |
|---|---|
| 氏名 | 必須、50文字以内 |
| メール | 必須、形式チェック、一意制約 |
| 電話番号 | 形式チェック |
| ステータス | 必須 |

## 発展課題

- ページング
- CSVダウンロード
- 論理削除
- 操作ログ
- 権限別メニュー
- 単体テスト
