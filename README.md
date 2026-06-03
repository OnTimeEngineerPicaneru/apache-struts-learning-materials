# Apache Struts 学習教材

このリポジトリは、社会人エンジニア向けに Apache Struts を体系的に学習するための教材です。

## 対象者

- Java の基本文法を理解している人
- Servlet / JSP の基礎を学習済み、または実務で触れたことがある人
- Spring Framework 以外の Java Web フレームワークを学びたい人
- レガシーシステム保守や大規模業務システム開発で Struts に触れる可能性がある人

## 学習対象

本教材では、主に **Apache Struts 2 / 6系** を対象にします。

> 注意: Struts 1.x は公式に End of Life となっており、現在は保守対象外です。新規開発では使用しません。既存システム保守や移行方針の理解を目的としてのみ扱います。

## 開発環境

- Java 17 以上
- Eclipse IDE for Enterprise Java and Web Developers
- Apache Maven
- Apache Tomcat 10 系または互換環境
- Apache Struts 6 系
- PostgreSQL

## 学習ロードマップ

### 初級（01〜10）

Strutsの基本構造、Eclipseでの開発、Action/JSP/struts.xml、タグライブラリ、Validation、Interceptor、JDBCを学習します。

### 中級（11〜24）

会員管理・ECサイトなどの業務システム演習、ConnectionPool、DI、テスト、ログ、認証認可、例外処理、Ajax、REST API、Spring連携、Spring Boot移行を学習します。

### 上級（25〜35）

Docker、PostgreSQL、CI/CD、SonarQube、OWASP Top10、コードレビュー、総合演習、模試、保守シミュレーションを通して実務レベルに仕上げます。

## 目次

### 基礎

1. [Apache Struts の概要](docs/01-overview.md)
2. [Eclipse 開発環境構築](docs/02-eclipse-setup.md)
3. [Apache Struts 開発チュートリアル](docs/03-struts-tutorial.md)
4. [Apache Struts の大規模開発](docs/04-large-scale-development.md)
5. [Apache Struts のセキュリティ](docs/05-security.md)
6. [Struts からの移行](docs/06-migration.md)

### Struts実装

7. [Strutsタグライブラリ編](docs/07-struts-tag-library.md)
8. [Validation Framework編](docs/08-validation-framework.md)
9. [Interceptor編](docs/09-interceptor.md)
10. [JDBC実践編](docs/10-jdbc-practice.md)

### 業務システム演習

11. [会員管理システム演習](docs/11-member-management-exercise.md)
12. [ECサイト演習](docs/12-ec-site-exercise.md)

### 実務開発

13. [JDBC ConnectionPool編](docs/13-jdbc-connection-pool.md)
14. [DI(Dependency Injection)編](docs/14-dependency-injection.md)
15. [テスト(JUnit/Mockito)編](docs/15-testing-junit-mockito.md)
16. [ログ(Log4j2/SLF4J)編](docs/16-logging-log4j2-slf4j.md)
17. [Tilesレイアウト編](docs/17-tiles-layout.md)
18. [ファイルアップロード編](docs/18-file-upload.md)
19. [認証・認可編](docs/19-authentication-authorization.md)
20. [例外ハンドリング編](docs/20-exception-handling.md)
21. [Ajax連携編](docs/21-ajax-integration.md)
22. [REST API連携編](docs/22-rest-api-integration.md)
23. [Spring連携編](docs/23-spring-integration.md)
24. [Struts→Spring Boot移行演習](docs/24-struts-to-spring-boot-migration.md)

### 運用・品質・セキュリティ

25. [Docker + Struts開発環境](docs/25-docker-struts-development.md)
26. [PostgreSQL実践編](docs/26-postgresql-practice.md)
27. [CI/CD(GitHub Actions)](docs/27-github-actions-ci-cd.md)
28. [SonarQube静的解析](docs/28-sonarqube-static-analysis.md)
29. [OWASP Top10とStruts](docs/29-owasp-top10-and-struts.md)
30. [実務コードレビュー演習](docs/30-practical-code-review.md)

### 総合演習・試験・保守

31. [総合演習① 会員管理システム完成版](docs/31-member-management-complete.md)
32. [総合演習② ECサイト完成版](docs/32-ec-site-complete.md)
33. [総合演習③ 在庫管理システム](docs/33-inventory-management-complete.md)
34. [Struts認定模試（100問）](docs/34-struts-certification-practice-100.md)
35. [実務保守シミュレーション演習](docs/35-maintenance-simulation.md)

## サンプルアプリ

`sample-struts-app` には、以下を含む学習用Strutsアプリを配置しています。

- HelloActionの最小サンプル
- 会員管理の最小実装
- Member model / Action / Service / Repository
- PostgreSQL用 `schema.sql`
- JUnit / Mockito のサンプルテスト
- GitHub Actions workflow

起動後、以下にアクセスします。

```text
http://localhost:8080/sample-struts-app/hello
http://localhost:8080/sample-struts-app/member/list
```

## 注意事項

Apache Struts は過去に重大な脆弱性が複数報告されているフレームワークです。学習目的で利用する場合でも、以下を必ず守ってください。

- 古い Struts を使用しない
- 公式のセキュリティ情報を確認する
- 不要なプラグインを導入しない
- 入力値検証を必ず行う
- ファイルアップロード処理は特に慎重に実装する
- 本番環境では常に最新の安定版を利用する

## ライセンス

MIT License
