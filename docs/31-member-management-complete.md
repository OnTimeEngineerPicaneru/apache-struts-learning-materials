# 31. 総合演習① 会員管理システム完成版

## 目的

これまで学習したStruts、JSP、Validation、JDBC、認証、例外処理を統合し、会員管理システムを完成させます。

## 完成要件

- 管理者ログイン
- 会員一覧
- 会員検索
- 会員登録
- 会員詳細
- 会員編集
- 会員削除
- 入力値検証
- DB連携
- 例外処理
- ログ出力
- 認可チェック

## URL設計

| URL | Action | JSP |
|---|---|---|
| /login | LoginAction | login.jsp |
| /logout | LogoutAction | - |
| /member/list | MemberListAction | member-list.jsp |
| /member/detail | MemberDetailAction | member-detail.jsp |
| /member/create | MemberCreateAction | member-form.jsp |
| /member/edit | MemberEditAction | member-form.jsp |
| /member/delete | MemberDeleteAction | member-delete-confirm.jsp |

## パッケージ構成

```text
com.example.member
├── action
├── service
├── repository
├── model
├── interceptor
├── exception
└── util
```

## 完成条件

- ActionにSQLを書かない
- JSPにJavaコードを書かない
- 入力値検証を実装する
- SQLはPreparedStatementを使う
- 未ログインで管理画面に入れない
- 管理者以外は削除できない
- エラー時に共通エラー画面を表示する

## 提出物

1. ソースコード
2. 画面遷移表
3. テーブル定義書
4. テスト項目表
5. コードレビュー結果

## 評価観点

| 観点 | 配点 |
|---|---:|
| 機能完成度 | 30 |
| 設計 | 25 |
| セキュリティ | 20 |
| テスト | 15 |
| 可読性 | 10 |
