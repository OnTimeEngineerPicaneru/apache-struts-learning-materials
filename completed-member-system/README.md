# completed-member-system

会員管理システム完成版の教材用プロジェクトです。

## 目的

Strutsを使った業務CRUDアプリケーションの完成形を確認します。

## 主な機能

- 管理者ログイン
- 会員一覧
- 会員検索
- 会員詳細
- 会員登録
- 会員編集
- 会員削除
- 入力値検証
- PostgreSQL連携
- 操作ログ
- 例外ハンドリング

## 推奨パッケージ構成

```text
com.example.member
├── action
├── service
├── repository
├── model
├── form
├── interceptor
├── exception
└── util
```

## 実装方針

- Actionは画面制御に限定する
- 業務ロジックはServiceへ置く
- SQLはRepositoryへ置く
- 入力値検証はValidation Frameworkを使う
- 認証・認可はInterceptorで共通化する

## 起動前準備

1. PostgreSQLを起動する
2. `db/schema.sql` を実行する
3. MavenでWARを作成する
4. Tomcatへデプロイする

```bash
mvn clean package
```
