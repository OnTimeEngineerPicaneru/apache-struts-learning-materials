# 28. SonarQube静的解析

## 目的

SonarQubeを使い、Strutsアプリケーションの品質、保守性、セキュリティリスクを静的解析する方法を学びます。

## 静的解析とは

プログラムを実行せずにソースコードを解析し、問題点を検出する手法です。

検出例:

- バグの可能性
- 脆弱性
- コードスメル
- 重複コード
- 複雑すぎるメソッド
- テスト不足

## SonarQubeで確認する指標

| 指標 | 説明 |
|---|---|
| Bugs | バグの可能性 |
| Vulnerabilities | 脆弱性 |
| Code Smells | 保守性の問題 |
| Duplications | 重複率 |
| Coverage | テスト網羅率 |
| Security Hotspots | セキュリティ上の確認ポイント |

## Dockerでの起動例

```yaml
services:
  sonarqube:
    image: sonarqube:community
    ports:
      - "9000:9000"
```

## Mavenでの解析例

```bash
mvn -f sample-struts-app/pom.xml sonar:sonar \
  -Dsonar.projectKey=sample-struts-app \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.login=TOKEN
```

## レガシーコード解析の観点

Struts案件では、以下に注目します。

- Actionが肥大化していないか
- JSPにJavaコードが混在していないか
- SQLが文字列連結されていないか
- 例外が握りつぶされていないか
- パスワードや個人情報がログ出力されていないか

## 演習

1. SonarQubeをDockerで起動する
2. Mavenから解析を実行する
3. Code Smellを1つ修正する
4. Security Hotspotを確認する
5. チームの品質ゲートを設計する
