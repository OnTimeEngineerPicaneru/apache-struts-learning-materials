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

## 教材の内容

1. Apache Struts の概要
2. Eclipse を使った開発環境構築
3. Struts アプリケーション開発チュートリアル
4. Action / JSP / struts.xml の基本
5. 大規模開発における設計・分割・保守
6. セキュリティ上の注意点
7. Struts から Spring MVC / Spring Boot への移行観点
8. 演習課題

## 開発環境

- Java 17 以上
- Eclipse IDE for Enterprise Java and Web Developers
- Apache Maven
- Apache Tomcat 10 系または互換環境
- Apache Struts 6 系

## 学習の進め方

```text
1. docs/01-overview.md を読む
2. docs/02-eclipse-setup.md に沿って環境構築する
3. sample-struts-app を Eclipse にインポートする
4. docs/03-struts-tutorial.md に沿ってアプリを作成・改修する
5. docs/04-large-scale-development.md で実務的な設計を学ぶ
6. docs/05-security.md でセキュリティ上の注意点を確認する
7. docs/06-migration.md で移行方針を学ぶ
8. docs/exercises.md の演習を解く
```

## サンプルアプリ

`sample-struts-app` に最小構成の Struts アプリを配置しています。

起動後、以下にアクセスします。

```text
http://localhost:8080/sample-struts-app/hello
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
