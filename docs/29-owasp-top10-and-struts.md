# 29. OWASP Top10とStruts

## 目的

OWASP Top10の観点から、Strutsアプリケーションで注意すべき脆弱性と対策を学びます。

## OWASP Top10とは

Webアプリケーションにおける代表的なセキュリティリスクを整理したものです。

## Strutsで特に注意する項目

| リスク | Strutsでの注意点 |
|---|---|
| Broken Access Control | 認可チェック漏れ |
| Cryptographic Failures | パスワードや個人情報の不適切な扱い |
| Injection | SQLインジェクション、OGNL関連リスク |
| Insecure Design | 権限設計や画面遷移設計の不備 |
| Security Misconfiguration | devMode有効、本番設定ミス |
| Vulnerable Components | 古いStrutsや依存ライブラリ |
| Identification and Authentication Failures | ログイン制御不備 |
| Software and Data Integrity Failures | 改ざんされた依存関係 |
| Logging and Monitoring Failures | 監査ログ不足 |
| SSRF | 外部URL取得機能の不備 |

## Struts固有の注意点

- 古いStrutsを使わない
- devModeを本番で有効化しない
- 不要なプラグインを導入しない
- OGNL式の扱いに注意する
- ファイルアップロードを厳格に制限する
- 入力値検証をサーバー側で必ず行う

## チェックリスト

- [ ] Strutsのバージョンは最新か
- [ ] 脆弱性情報を確認しているか
- [ ] 認証が必要なURLをInterceptorで保護しているか
- [ ] 管理者機能に認可チェックがあるか
- [ ] SQLはPreparedStatementを使用しているか
- [ ] ファイルアップロード制限があるか
- [ ] 本番でdevModeがfalseか
- [ ] エラー画面に内部情報を出していないか
- [ ] 監査ログを残しているか

## 演習

1. 既存のsample-struts-appに対する脅威を洗い出す
2. 会員管理システムの認可設計を作成する
3. SQLインジェクション対策を説明する
4. ファイルアップロード機能のリスクを列挙する
5. OWASP Top10チェック表を作る
